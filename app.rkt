#lang racket

;; web-server/web-server API

(require web-server/web-server
         web-server/http
         web-server/http/xexpr
         web-server/http/response
         (prefix-in files: web-server/dispatchers/dispatch-files)
         (prefix-in sequencer: web-server/dispatchers/dispatch-sequencer)
         web-server/dispatchers/filesystem-map
         web-server/dispatchers/dispatch
         net/url)

(require "home.rkt" "projects.rkt" "about.rkt" "contact.rkt"
         "layout.rkt" "404-page.rkt")

;; Routing

; route : request -> response
; Consumes a request and routes to the appropriate page.
(define (route request)
  (define path
    (map path/param-path (url-path (request-uri request))))
  (cond
    [(or (empty? path) (equal? path '("")))
     (response/xexpr (render-home-page request))]
    [(equal? path '("projects"))
     (response/xexpr (render-projects-page request))]
    [(equal? path '("about"))
     (response/xexpr (render-about-page request))]
    [(equal? path '("contact"))
     (response/xexpr (render-contact-page request))]
    [else
     (response/xexpr #:code 404 (render-404-page))]))

;; Dispatchers

; app-dispatcher : request -> does not return
; Handles the request.
(define (app-dispatcher conn req)
  (output-response conn (route req)))

; htdocs-path : path?
; Path to the directory containing static files.
(define htdocs-path
  (build-path (current-directory) "htdocs"))

; static-dispatcher : dispatcher?
; Dispatches requests for static files from the htdocs directory.
(define static-dispatcher
  (files:make
   #:url->path (make-url->path htdocs-path)
   #:path->mime-type (lambda (path) #"application/octet-stream")))

; dispatcher : dispatcher?
; Dispatches requests by first checking for static files,
; then routing requests to the application.
(define dispatcher
  (sequencer:make static-dispatcher app-dispatcher))

;; Serve

; stop-server : -> void?
; Stops the web server.
(define stop-server
  (serve #:dispatch dispatcher
         #:port 8000
         #:listen-ip #f))

(printf "Serving on http://localhost:8000/\n")
(printf"Press Ctrl+C to stop.\n")

; Keep the main thread alive until interrupted.
(with-handlers ([exn:break? (lambda (e) (stop-server) (exit 0))])
  (sync/enable-break never-evt))
  