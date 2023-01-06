FROM lightninglabs/lnd:v0.15.5-beta

ARG GID
ARG UID

RUN echo GID=${GID}, UID=${UID}
RUN addgroup -g ${GID} lnds && adduser -S -G lnds -u ${UID} lnds
USER lnds

ENTRYPOINT [ "lnd", "--lnddir=/data/lnd" ]
EXPOSE 9735
EXPOSE 10009
VOLUME [/data/lnd]
