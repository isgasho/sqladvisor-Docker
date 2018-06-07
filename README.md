#SqlAdvisor docker 
(非官方)
## 构建
```sh
    docker build -t sqladvisor .   # 开始构建一个名字叫sqladvisor的镜像
```

## 使用

1.输出

```sh

#cmd docker run -i -t --rm sqladvisor  -?


------------------输出-----------------
Usage:
  sqladvisor [OPTION...] sqladvisor

SQL Advisor Summary

Help Options:
  -?, --help              Show help options

Application Options:
  -f, --defaults-file     sqls file
  -u, --username          username
  -p, --password          password
  -P, --port              port
  -h, --host              host
  -d, --dbname            database name
  -q, --sqls              sqls
  -v, --verbose           1:output logs 0:output nothing
  
  
#cmd docker run -i -t --rm sqladvisor  -h xx.xx.xx.xx  -P 3306  -u root -p 123456 -d test -q "select * from test" -v 1
```


2.在docker中 如何使用-f 

sql.cnf 文件内容
```
[sqladvisor]
username=xx
password=xx
host=xx
port=xx
dbname=xx
sqls=sql1;sql2;sql3....

```
```
#cmd docker run -i -t --rm -v $PWD:/data sqladvisor  -f /data/sql.cnf -v 1
```

[镜像](https://hub.docker.com/r/yuloyu/sqladvisor/)

[官方git](https://github.com/Meituan-Dianping/SQLAdvisor)

[官方使用文档](https://github.com/Meituan-Dianping/SQLAdvisor/blob/master/doc/QUICK_START.md)


##附录 

求大神告诉我 如何把 sqladvisor sqladvisor 两个变为一个？
直接 docker run -i -t --rm sqladvisor  -? 使用

在Dockerfile 文件里面 最后一行 加入CMD ['sqladvisor'] 没用

已经解决。用 ENTRYPOINT 








