FROM alpine:latest

RUN apk add --no-cache wget unzip ca-certificates

WORKDIR /app

RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray-linux-64.zip \
    && chmod +x v2ray

COPY config.json /app/config.json

CMD ["./v2ray", "run", "-config", "config.json"]
