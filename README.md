# lnd docker

```bash
docker image build --build-arg GID=`id -g` --build-arg UID=`id -u` -t aaa .
docker run -it --mount type=bind,source=`pwd`/lnddata,target=/data/lnd aaa
```

```bash
export GID=`id -g`
export UID
docker compose -f docker-compose.yml up
```

```bash
export GID=`id -g`
export UID
docker compose -f docker-compose2.yml up
```
