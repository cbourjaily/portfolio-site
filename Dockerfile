FROM racket/racket:8.18-full
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/* \
    && git config --system --add safe.directory /app

COPY . .
RUN raco pkg install --auto --no-setup mime-type-lib \
    && raco setup --no-docs --pkgs mime-type-lib
EXPOSE 8000
CMD ["racket", "app.rkt"]
