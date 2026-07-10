#lang racket
(require "layout.rkt")

(define (render-home-page request)
  (page
   "Home"
   `(div
     (h1 "Home")
     (p "Home coming soon."))))









(provide render-home-page)