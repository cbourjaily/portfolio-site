FROM racket/racket:8.18

WORKDIR /app

COPY . .

RUN raco pkg install --auto web-server net-lib

EXPOSE 8000

CMD ["racket", "app.rkt"]
