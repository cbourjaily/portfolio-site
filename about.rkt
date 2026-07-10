#lang racket
(require "layout.rkt")

(define (render-about-page request)
  (page
   "About"
   `(div
     (h1 "About")
     (p "About page coming soon."))))











(provide render-about-page)