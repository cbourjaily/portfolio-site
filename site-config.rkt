#lang racket

(require racket/system
         racket/string
         racket/port
         racket/match)

(define (git-last-updated)
  (match-define (list stdout stdin pid stderr control)
    (process* (find-executable-path "git")
              "log"
              "-1"
              "--format=%ad"
              "--date=format:%B %-d, %Y"))
  (close-output-port stdin)

  (define date
    (string-trim (port->string stdout)))
  (close-input-port stdout)
  (close-input-port stderr)
  (control 'wait)
  (if (string=? date "")
      "Unknown"
      date))

;; Site metadata
(define LAST-UPDATED (git-last-updated))
(define SITE-AUTHOR "Christopher Vote")
(define SITE-DESCRIPTION
  "Computer Science portfolio and projects by Christopher Vote.")
(define SITE-YEAR 2026)
(define SITE-LICENSE "MIT License")
(define SITE-SOURCE-URL
  "https://github.com/cbourjaily/portfolio-site")


(provide
 SITE-AUTHOR
 SITE-DESCRIPTION
 SITE-YEAR
 SITE-LICENSE
 LAST-UPDATED
 SITE-SOURCE-URL)
