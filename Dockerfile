FROM hugomods/hugo:0.143.1 AS builder

WORKDIR /src
COPY . /src
RUN hugo --minify --themesDir themes

FROM nginx:1.26.2-alpine
COPY --from=builder /src/public /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
