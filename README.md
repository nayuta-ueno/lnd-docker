# lnd docker

```bash
docker image build -t aaa .
docker run -it --mount type=bind,source=`pwd`/lnddata,target=/data/lnd aaa
```
