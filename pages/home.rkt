#lang racket
(require "../layout.rkt")

(define (render-home-page request)
  (page
   "Home"
   `(main
     (h1 "Home")

     (p
      "Welcome to my portfolio.")

     (p
      "Here you'll find a collection of software projects I have built.")
     
     (p
      "Feel free to explore using the navigation above."))))
      

(provide render-home-page)
