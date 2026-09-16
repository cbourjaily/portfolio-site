#lang racket
(require "../layout.rkt")

(define (render-projects-page request)
  (page
   "Projects"
   `(div
     (h1 "Projects")

     ;; impact-commerce-engine
     (article
      (h2 "impact-commerce-engine")

      (figure
       (img ((class "project-image")
             (src "/images/thuida.png")
             (alt "Thuida — example storefront powered by impact-commerce-engine")))
       (figcaption
        "Example deployment: Thuida"))

      (p
       (strong "Language: ") "Common Lisp")

      (p
       "A backend pipeline that pulls affiliate product feeds into "
       "a searchable SQLite catalog. Built around Impact.com's feed "
       "format, with the vendor-specific parsing isolated to a "
       "single file so the rest of the pipeline -- schema, storage, "
       "retailer onboarding -- doesn't depend on it. Powers "
       (a ((href "https://thuida.com/")) "Thuida")
       ", a live storefront.")

      (p
       (a ((href "https://thuida.com/"))
          "Live Example")

       " | "

       (a ((href "https://github.com/cbourjaily/thuida"))
          "Source Code")))

     ;; icmp-ping-gui
     (article
      (h2 "icmp-ping-gui")

      (figure
       (img ((class "project-image")
             (src "/images/icmp-ping-gui.png")
             (alt "ICMP Ping GUI")))
       (figcaption
        "icmp-ping-gui sending live requests"))

      (p
       (strong "Language: ") "Python")

      (p
       "A desktop GUI built to send ICMP echo requests without depending "
       "on the operating system's "
       (code "ping")
       " utility — the application constructs, sends, and validates ICMP "
       "packets directly in Python, streaming results live through a "
       "responsive interface.")

      (p
       (a ((href "https://github.com/cbourjaily/icmp-ping-gui/releases/tag/v1.0.0"))
          "Linux Download")
       " | "
       (a ((href "https://github.com/cbourjaily/icmp-ping-gui"))
          "Source Code")))

     ;; small-shell
     (article
      (h2 "small-shell")

      (figure
       (img ((class "project-image")
             (src "/images/small-shell.png")
             (alt "small-shell demonstration")))
       (figcaption
        "small-shell running interactively"))

      (p
       (strong "Language: ") "C")

      (p
       "A Unix-like shell built from scratch to understand how process "
       "management actually works under the hood. Implements process "
       "creation, job control, signal handling, built-in commands, and "
       "I/O redirection.")

      (p
       (a ((href "https://github.com/cbourjaily/small-shell"))
          "Source Code"))))))

(provide render-projects-page)
