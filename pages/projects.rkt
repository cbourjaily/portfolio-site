#lang racket
(require "../layout.rkt")

(define (render-projects-page request)
  (page
   "Projects"
   `(div
     (h1 "Projects")
     (p "Projects page coming soon."))))






(provide render-projects-page)