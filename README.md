# lnd docker

## container

### start

```bash
# from host
./compose.sh up [-d]
```

### stop

```bash
# from host
./compose.sh down [-v]
```

## login

### bitcoind

```bash
# from host
docker exec -it lnd-docker-mybitcoind-1 /bin/sh
```

```bash
# from container
bitcoin-cli -datadir=/data/.bitcoin -regtest getblockcount
```

```bash
# from host
curl --user rpcuser:rpcpass  --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getblockcount", "params": []}' -H 'content-type: text/plain;' http://127.0.0.1:8332/
```

### lnd

```bash
# from host
docker exec -it lnd-docker-mylnd1-1 /bin/sh
```

```bash
# from container
lncli -n regtest --lnddir=/data/lnd getinfo
```

#### add new lnd client

add `mylndx`

1. docker-compose.yml
  1. copy `mylnd1` and paste as `mylndx`.
  1. replace `lnd-data1` to `lnd-datax` in `mylndx.volumes` section.
  1. replace `./lnddata/data2:/mnt` to `./lnddata/datax:/mnt` in `mylndx.volumes` section.
  1. add `sleep 1d &&` to `lnd-datax.entrypoint` section after `mkdir` line.
  1. edit `lnd-datax.ports` section to avoid duplication with others.
  1. add `lnd-datax` to root `volumes` section.
1. run `mkdir lnddata/datax`
1. run `./compose.sh up`
1. run `docker exec -it lnd-docker-mylndx-1 /bin/sh`
  1. run `lnd --configfile=/data/lnd.conf --lnddir=/data/lnd > /dev/null&`
  1. run `cp /data/lnd/tls.* /mnt/`
  1. run `cd /data/lnd/data/chain/bitcoin/regtest/ && cp admin.macaroon macaroons.db wallet.db /mnt/`
  1. run `exit`
1. run `./compose.sh down -v`
1. edit docker-compose.yml and remove `sleep` line.

## initialize

Generate 101 blocks and reward to 'lnd-docker-lnd-1' address.

```bash
curl --user rpcuser:rpcpass  --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "generatetoaddress", "params": [101, "bcrt1q4zhf82t39pfh4zsdv3r8n3ljc32mzx4x64r6fa"]}' -H 'content-type: text/plain;' http://127.0.0.1:8332/
```
