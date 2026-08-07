FROM racket/racket:8.18-full
WORKDIR /app
COPY . .
RUN raco pkg install --auto --no-setup mime-type-lib
EXPOSE 8000
CMD ["racket", "app.rkt"]
