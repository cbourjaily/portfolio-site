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
      "Feel free to explore using the navigation above.")
      
     (p
      "Impact-Site-Verification: 1135a262-4059-49c1-9d13-04ed90521cdf"))))
      

(provide render-home-page)
