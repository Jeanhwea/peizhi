## peizhi
配置（peizhi）微服务是配置文件中心化管理的微服务

## 启动微服务

### 使用获取远端 git 仓库方式启动
```sh
docker run --restart always --detach \
       --name peizhi --hostname $(hostname) \
       -p 9000:8080 \
       -e 'USE_GIT_REPOSITORY=true' \
       -e 'URI=http://github.com/username/gitrepo.git' \
       -e 'USERNAME=user' \
       -e 'PASSWORD=pass' \
       -e 'SEARCH=common,database,services' \
       -v /var/log/peizhi:/app/log \
       peizhi
```

### 使用本地 git 仓库方式启动
```sh
docker run --restart always --detach \
       --name peizhi --hostname $(hostname) \
       -p 9000:8080 \
       -v /var/log/peizhi:/app/log \
       -v /local/git/repo:/app/log \
       peizhi
```
