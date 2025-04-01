FROM alpine:3.21.3

RUN apk add --no-cache aws-cli postgresql17-client curl && rm -rf /var/cache/apk/*

RUN mkdir /opt/backup

WORKDIR /opt/backup

COPY backup_and_upload.sh .

CMD ["sh", "backup_and_upload.sh"]
