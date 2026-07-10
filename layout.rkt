#lang racket

(define (nav-bar)
  `(nav
    (a ((href "/")) "Home")
    " | "
    (a ((href "/projects")) "Projects")
    " | "
    (a ((href "/about")) "About")
    "|"
    (a ((href "/contact")) "Contact")))

(define (page title body)
  `(html
    (head
     (title ,title))
    (body
     ,(nav-bar)
     ,body)))















(provide page nav-bar)