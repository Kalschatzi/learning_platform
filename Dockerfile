FROM hugomods/hugo:0.143.1 AS builder

WORKDIR /src
COPY . /src

RUN hugo --minify --themesDir themes

EXPOSE 8888
CMD ["hugo", "server", "--bind", "0.0.0.0", "--port", "8888", "--baseURL", "https://learn.kalschatzi.com", "--appendPort=false"]
