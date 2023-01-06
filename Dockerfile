FROM lightninglabs/lnd:v0.15.5-beta

RUN addgroup lnds && adduser -S -G lnds lnds
# RUN mkdir -p /data/lnd && chmod -R 0777 /data && chown -R lnds.lnds /data
# COPY "./lnd.conf" /data/lnd/lnd.conf
# RUN chmod 444 /data/lnd/lnd.conf

USER lnds
ENTRYPOINT [ "lnd", "--lnddir=/data/lnd" ]
EXPOSE 9735
EXPOSE 10009
VOLUME [/data/lnd]
