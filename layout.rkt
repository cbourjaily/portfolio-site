#lang racket

(define (nav-bar)
  `(nav
    (a ((href "/")) "Home")
    " | "
    (a ((href "/projects")) "Projects")
    " | "
    (a ((href "/about")) "About the Coder")
    " | "
    (a ((href "/contact")) "Contact")))

(define (page title body)
  `(html
    (head
     (meta ((charset "utf-8")))
     (title ,title)
     (link ((rel "stylesheet")
            (href "/css/site.css"))))
    (body
     ,(nav-bar)
     ,body
     ,(my-footer)
    )))

(define LOGO
  `(img ((src "/images/racket-logo.svg")
           (alt "Racket")
           (class "tech-icon"))))

(define LAST-UPDATED "July 11, 2026")

(define (my-footer)
  `(footer
   (p "Built with"
      ,LOGO
      ".")
   (p
    (a ((href "https://github.com/cbourjaily/portfolio-site"))
       "View source on GitHub"))
   (p "© 2026 Christopher Vote · MIT License")
   (p "Last updated: " ,LAST-UPDATED)))

(provide page nav-bar)