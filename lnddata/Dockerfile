FROM lightninglabs/lnd:v0.15.5-beta

RUN mkdir -p /data/lnd/data/chain/bitcoin/regtest && chmod 0777 -R /data/lnd
CMD ["lnd"]
EXPOSE 9735
EXPOSE 10009
