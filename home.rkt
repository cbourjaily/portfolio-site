#lang web-server/insta

(define (start request)
  (response/xexpr
   `(html
     (head (title "Portfolio Home")
           (body (h1 "Coming soon"))))))