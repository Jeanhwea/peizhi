## peizhi
配置（peizhi）微服务是配置文件中心化管理的微服务

## 启动微服务
```shell
docker run --restart always --detach \
  --name peizhi --publish 9000:8080 \
  --volume /var/log/peizhi:/app/log \
  peizhi
```
