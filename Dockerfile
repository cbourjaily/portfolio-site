FROM racket/racket:8.18

WORKDIR /app

COPY . .

EXPOSE 8000

CMD ["racket', "app.rkt"]
