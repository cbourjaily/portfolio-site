#lang racket


;; web-server/web-server API
(require web-server/web-server                    ; serve
         web-server/http                          ; request/response structs
         web-server/http/xexpr                    ; response/xexpr
         web-server/http/response                 ; output-response
         (prefix-in files: web-server/dispatchers/dispatch-files)
         (prefix-in sequencer: web-server/dispatchers/dispatch-sequencer)
         web-server/dispatchers/filesystem-map    ; make-url->path
         web-server/dispatchers/dispatch          ; dispatcher/c
         net/url                                  ; url-path, path/param-path
         net/mime-type)                           ; path->mime-type      
                                              

(require "pages/home.rkt" "pages/projects.rkt" "pages/about.rkt" "pages/contact.rkt"
         "layout.rkt" "pages/404-page.rkt")


;; Routing

; route : request? -> response
; Consumes an HTTP request and produces the appropriate response.
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

; app-dispatcher : connection? request? -> does not return
; Consumes a network connection and an HTTP request, then sends
; the appropriate response over the connection.
(define (app-dispatcher connection request)
  (output-response connection (route request)))

; htdocs-path : path?
; Produces the path to the directory containing static files.
(define htdocs-path
  (build-path (current-directory) "htdocs"))

; static-dispatcher : dispatcher/c
; Dispatches requests for static files from the htdocs directory.
(define static-dispatcher
  (files:make
   #:url->path (make-url->path htdocs-path)
   #:path->mime-type
   (lambda (path)
     (or (path-mime-type path) #"application/octet-stream"))))

; dispatcher : dispatcher/c
; Dispatches requests by first attempting to serve static files,
; then routing requests to the application.
(define dispatcher
  (sequencer:make static-dispatcher app-dispatcher))
  

;; Server

; stop : -> void?
; Procedure returned by serve. Calling it stops the server and
; releases the listening socket.
(define stop
  (serve #:dispatch dispatcher
         #:port
         (let ([p (getenv "PORT")])
           (if p
               (string->number p)
               8000))
         #:listen-ip #f))

(printf "Serving on http://localhost:8000/\n")
(printf "Press Ctrl+C to stop.\n")

; Keep the main thread alive until interrupted (Ctrl+C).
(with-handlers ([exn:break? (lambda (e) (stop) (exit 0))])
  (sync/enable-break never-evt))
