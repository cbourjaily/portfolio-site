FROM racket/racket:8.18

WORKDIR /app

COPY . .

RUN raco pkg install --auto --no-docs web-server mime-type-lib 

EXPOSE 8000

CMD ["racket", "app.rkt"]
