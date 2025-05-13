FROM alpine:latest

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description=""

RUN apk update --no-cache  \
    && apk add --no-cache tzdata

ENV TZ=Asia/Seoul

COPY init.sh init.sh
RUN chmod +x init.sh

ENTRYPOINT [ "./init.sh" ]
