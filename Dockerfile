FROM racket/racket:8.18

WORDIR /app

copy . .

EXPOSE 8000

CMD ["racket', "app.rkt"]
