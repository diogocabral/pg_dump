FROM alpine:3.20.2

RUN apk add --no-cache aws-cli postgresql16-client && rm -rf /var/cache/apk/*

RUN mkdir /opt/backup

WORKDIR /opt/backup

COPY backup_and_upload.sh .

CMD ["sh", "backup_and_upload.sh"]
