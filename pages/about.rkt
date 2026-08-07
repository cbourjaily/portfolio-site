#lang racket
(require "../layout.rkt")

(define PORTRAIT
  `(img ((src "/images/profile.png")
           (alt "Christopher Vote profile")
           (class "about-photo"))))

(define (render-about-page request)
  (page
   "About the Coder"
   `(div ((class "about"))
     (h1 "About the Coder")
     ,PORTRAIT
     (p "Hello, and thanks for visiting my site.")

     (p "This website is a collection of software projects I have built while studying computer science and
         exploring software development, both in and out of the classroom.")

     (p "What I enjoy most about programming is that it combines creativity with problem solving. I enjoy both
         the process of building software and understanding how ideas become working code.")

     (p "Whether learning about algorithms, exploring systems programming, or studying programming languages, I
         enjoy understanding how systems work beneath their abstractions.")

     (p "Feel free to get in touch using the links in the Contact section.")

     (p ((class "signature")) "-Christopher Vote"))))

(provide render-about-page)