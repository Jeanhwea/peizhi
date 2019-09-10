## peizhi
配置（peizhi）微服务是配置文件中心化管理的微服务

## 启动微服务
```sh
docker run --restart always --detach \
       --name peizhi --hostname $(hostname) \
       -p 9000:8080 \
       -e 'URI=http://hostname/user' \
       -e 'USERNAME=user' \
       -e 'PASSWORD=pass' \
       -v /var/log/peizhi:/app/log \
       peizhi
```
