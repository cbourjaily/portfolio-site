#lang racket
(require "../layout.rkt")

(define PORTRAIT
  `(img ((src "/images/christopher-vote.jpg")
           (alt "Christopher Vote during wildland firefighting assignment")
           (class "about-photo"))))

(define (render-about-page request)
  (page
   "About the Coder"
   `(div ((class "about"))
     (h1 "About the Coder")
     ,PORTRAIT
     (p "Welcome, and thanks for stopping by.")

     (p "This website is a collection of software projects I have built while studying computer science and
         exploring programming both inside and outside of the classroom. It reflects not only what I've
         learned, but also the ways I enjoy learning.")

     (p "I am currently pursuing a post-baccalaureate degree in Computer Science at Oregon State University,
         after an earlier academic career in economics and graduate research in Japan.")

     (p "Before returning to university, I worked in a variety of professions, including teaching, commercial
         fishing, retail marketing, and emergency response. These endeavors taught me much in the ways of
         perseverance, adaptability, and the value in approaching difficult problems with both methodology and
         resolve.")

     (p "I enjoy learning programming languages not simply as tools, but as modes of thinking about software
         design. For example, C appeals to me because of its precision, explicitness, performance, and the
         satisfaction of carefully translating an idea into a working program. Racket has shown me a different
         approach to program design and implementation. What initially looked like unusual syntax quickly became
         an enjoyable language, in which writing code can often feel remarkably expressive.")

     (p "Curiosity drives much of what I do. I enjoy understanding how systems function beneath their abstractions,
         whether that means exploring algorithms, systems programming, programming languages, or how applications
         are constructed.")

     (p "This website is part of that journey. From my original aim to construct a website to showcase my programming
         projects, the site has also become a project in its own right. Instead of relying on a web framework with
         which I had prior familiarity, I chose to build the site in Racket, utilizing its built-in web server. This
         has provided me with an opportunity to continue exploring a language, while taking another step in learning
         to build complete software applications.")

     (p "When not programming, I enjoy hiking in the woods, traveling, woodworking, and combat sports.")

     (p "Whether you are here to browse projects, discuss programming, or simply see what I've been working on, thank
         you for visiting.")

     (p ((class "signature")) "-Christopher Vote"))))

(provide render-about-page)