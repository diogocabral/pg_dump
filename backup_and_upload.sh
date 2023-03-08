#!/bin/bash

FILENAME=${POSTGRES_DB}_`date +'%d_%m_%Y'`.backup

pg_dump -O -x --dbname=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB} -v -F c -Z 9 -n public ${PG_DUMP_ARGS} -f ${FILENAME}

aws s3 cp ${FILENAME} ${BUCKET}
