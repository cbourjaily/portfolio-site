#lang racket
(require "../layout.rkt")

(define (render-home-page request)
  (page
   "Home"
   `(main
     (h1 "Home")
     (p "This website showcases my personal software projects.")
     (p "Explore the navigation tabs above, or follow this " (a ((href "/projects")) "link") " directly to the projects.")
     (p "Thanks for visiting!")
     (p "-Christopher Vote"))))

(provide render-home-page)