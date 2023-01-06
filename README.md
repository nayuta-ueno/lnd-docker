# lnd docker

```bash
docker image build --build-arg GID=`id -g` --build-arg UID=`id -u` -t aaa .
docker run -it --mount type=bind,source=`pwd`/lnddata,target=/data/lnd aaa
```
