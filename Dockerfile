FROM lightninglabs/lnd:v0.15.5-beta

ARG GID
ARG UID

RUN echo GID=${GID}, UID=${UID}
RUN addgroup -g ${GID} lnds && adduser -S -G lnds -u ${UID} lnds
# RUN mkdir -p /data/lnd && chmod -R 0777 /data && chown -R lnds.lnds /data
# COPY "./lnd.conf" /data/lnd/lnd.conf
# RUN chmod 444 /data/lnd/lnd.conf

USER lnds
ENTRYPOINT [ "lnd", "--lnddir=/data/lnd" ]
EXPOSE 9735
EXPOSE 10009
VOLUME [/data/lnd]
