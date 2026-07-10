#lang racket

(require "layout.rkt")

(define (render-contact-page request)
  (page
   "Contact"
   `(div
     (h1 "Contact")
     (p "Contact page coming soon."))))












(provide render-contact-page)