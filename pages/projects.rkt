#lang racket
(require "../layout.rkt")

(define (render-projects-page request)
  (page
   "Projects"
   `(div
     (h1 "Projects")

     ;; icmp-ping-gui
     (article
      (h2 "icmp-ping-gui")

      (img ((class "project-image")
            (src "/images/icmp-ping-gui.png")
            (alt "ICMP Ping GUI")))

      (p
       (strong "Language: ") "Python")

      (p
       "A desktop GUI for sending ICMP echo requests without relying on the operating system's "
       (code "ping")
       " utility. The application constructs, sends, and validates ICMP packets directly "
       "in Python while streaming results live through a responsive interface.")

      (p
       (a ((href "https://github.com/cbourjaily/icmp-ping-gui/releases/tag/v1.0.0"))
          "Linux Download")
       
       " | "
       
       (a ((href "https://github.com/cbourjaily/icmp-ping-gui"))
          "Source Code")))
     
     ;; small-shell
     (article
      (h2 "small-shell")
      
      (img ((class "project-image")
            (src "/images/small-shell.png")
            (alt "small-shell demonstration")))

      (p
       (strong "Language: ") "C")

      (p
       "A Unix-like shell implementing process creation, job control, "
       "signal handling, built-in commands, and I/O redirection.")

      (p
       (a ((href "https://github.com/cbourjaily/small-shell")) "Source Code"))))))


(provide render-projects-page)