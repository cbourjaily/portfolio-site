#lang racket

(require racket/string
         racket/port)


;; last-updated : -> string?
;; Reads the build date baked into the image at /app/last-updated.txt
;; (written by the Dockerfile at build time). Falls back to "Unknown"
;; if the file is missing, e.g. when running outside the container.
(define (last-updated)
  (define path "/app/last-updated.txt")
  (with-handlers ([exn:fail? (lambda (e) "Unknown")])
    (define contents
      (string-trim (call-with-input-file path port->string)))
    (if (string=? contents "")
        "Unknown"
        contents)))


;; Site metadata
(define LAST-UPDATED
  (last-updated))

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