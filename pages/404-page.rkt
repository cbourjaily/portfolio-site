#lang racket

(require "../layout.rkt")

; render-404-page : -> xexpr
; Produces an HTML page indicating that the requested page
; was not found.
(define (render-404-page)
  (page
   "404"
   `(div
     (h1 "404")
     (p "Page not found."))))

(provide render-404-page)