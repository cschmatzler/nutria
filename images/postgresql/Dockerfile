FROM cschmatzler/wal-g:2.0.1 AS wal-g
FROM postgres:15.1-alpine3.16

COPY --from=wal-g /wal-g /

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
