FROM racket/racket:8.18-full
WORKDIR /app

COPY . .

RUN raco pkg install --auto --no-setup mime-type-lib \
    && raco setup --no-docs --pkgs mime-type-lib

RUN date "+%B %-d, %Y" > /app/last-updated.txt

EXPOSE 8000
CMD ["racket", "app.rkt"]
