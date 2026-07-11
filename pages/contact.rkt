#lang racket

(require "../layout.rkt")

(define (render-contact-page request)
  (page
   "Contact"
   `(div ((class "contact"))
      (h1 "Contact")

      (p "Thank you for visiting my website.")

      (p
       "If you have questions about the projects presented here, would like to discuss programming,
        or simply wish to get in touch, I would be happy to hear from you.")

      (p
       (strong "Email:")
       (br)
       (a ((href "mailto:cbourjaily@gmail.com"))
          "cbourjaily@gmail.com"))

      (p
       (strong "GitHub:")
       (br)
       (a ((href "https://github.com/cbourjaily"))
          "github.com/cbourjaily"))

      (p
       (strong "LinkedIn:")
       (br)
       (a ((href "https://www.linkedin.com/in/christopher-vote-b354abb8/"))
          "linkedin.com/in/christopher-vote-b354abb8")))))

(provide render-contact-page)