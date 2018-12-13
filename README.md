# nginx-sample
update nginx image for CICD

## build
```
make build
```

## push
```
docker login wangxinsh
docker push wangxinsh/timestamp-nginx:latest
```


## deploy
```
kubectl run ts-nginx --image=wangxinsh/timestamp-nginx:latest
```

```
kubectl expose ts-nginx 
```
