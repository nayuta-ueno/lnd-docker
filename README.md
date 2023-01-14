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

## initialize

Generate 101 blocks and reward to 'lnd-docker-lnd-1' address.

```bash
curl --user rpcuser:rpcpass  --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "generatetoaddress", "params": [101, "bcrt1q4zhf82t39pfh4zsdv3r8n3ljc32mzx4x64r6fa"]}' -H 'content-type: text/plain;' http://127.0.0.1:8332/
```
