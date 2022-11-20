FROM cschmatzler/wal-g:2.0.1 AS wal-g
FROM bitnami/postgresql:15.1.0

ENV WALG_COMPRESSION_METHOD brotli
ENV POSTGRESQL_EXTRA_FLAGS "-c wal_level=logical -c archive_mode=on -c archive_timeout=60 -c archive_command='/wal-g wal-push /bitnami/postgresql/%p' -c restore_command='/wal-g wal-fetch %f /bitnami/postgresql/%p'"
