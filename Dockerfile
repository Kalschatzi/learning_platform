FROM hugomods/hugo:0.143.1 AS builder

WORKDIR /src
COPY . /src

RUN hugo --minify --themesDir themes

EXPOSE 1313
CMD ["hugo", "server", "--bind", "0.0.0.0", "--port", "8888", "--baseURL", "http://localhost:8888", "--appendPort=false"]
