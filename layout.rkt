#lang racket
(require "site-config.rkt")

;; Navigation

(define (nav-bar)
  `(nav
    (a ((href "/")) "Home")
    " | "
    (a ((href "/projects")) "Projects")
    " | "
    (a ((href "/about")) "About the Coder")
    " | "
    (a ((href "/contact")) "Contact")))


;; Page layout

(define (page title body)
  `(html
    (head
     (meta ((charset "utf-8")))
     (title ,title)
     (link ((rel "stylesheet")
            (href "/site.css")))
     (script ((src "/lightbox.js") (defer "")))
     )
    (body
     ,(nav-bar)
     ,body
     ,(my-footer)
     )))


;; Footer

(define RACKET-LOGO
  `(img ((src "/images/racket-logo.svg")
         (alt "Racket")
         (class "tech-icon"))))

(define (my-footer)
  `(footer
    (p
     "Built with "
     (a ((href "https://racket-lang.org")
         (target "_blank")
         (rel "noopener noreferrer"))
        ,RACKET-LOGO)
     ".")
    (p
     (a ((href "https://github.com/cbourjaily/portfolio-site"))
        "View the source code for this site on GitHub"))
    (p "© " ,(~a SITE-YEAR) " Christopher Vote · " ,SITE-LICENSE)
    (p "Last updated: " ,LAST-UPDATED)))

(provide page nav-bar)