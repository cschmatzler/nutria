FROM cschmatzler/wal-g:2.0.1 AS wal-g
FROM postgres:15.1-alpine3.16

COPY --from=wal-g /wal-g /

ENV PGDATA /data/postgresql
ENV WALG_COMPRESSION_METHOD brotli

CMD ["postgres","-c", "wal_level=logical","-c", "archive_mode=on","-c", "archive_timeout=60","-c", "archive_command='/wal-g wal-push /data/postgresql/%p'","-c", "restore_command='/wal-g wal-fetch %f %p'"]
