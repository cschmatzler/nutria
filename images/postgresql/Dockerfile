FROM cschmatzler/wal-g:2.0.1 AS wal-g
FROM bitnami/postgresql:15.1.0

COPY --from=wal-g /wal-g /

ENV WALG_COMPRESSION_METHOD brotli

