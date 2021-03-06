FROM alpine:3.6 as alpine
RUN apk add -U --no-cache ca-certificates

FROM scratch
MAINTAINER Bo-Yi Wi <appleboy.tw@gmail.com>

ENV GODEBUG=netdns=go

COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

LABEL org.label-schema.version=latest
LABEL org.label-schema.vcs-url="https://github.com/appleboy/gorush.git"
LABEL org.label-schema.name="Gorush"
LABEL org.label-schema.vendor="Bo-Yi Wu"
LABEL org.label-schema.schema-version="1.0"

ADD config/config.yml /
ADD bin/gorush /

EXPOSE 8088
ENTRYPOINT ["/gorush"]
CMD ["-c", "config.yml"]
