# 安装说明
## 1.lnmp

`wget http://soft.vpser.net/lnmp/lnmp1.6.tar.gz -cO lnmp1.6.tar.gz && tar zxf lnmp1.6.tar.gz && cd lnmp1.6 && ./install.sh lnmp`

## 2.网站

```bash
cd /home/wwwroot/sspanel
git clone https://github.com/zhkong/SSPanel-Uim.git ${PWD}
git reset --hard
git config core.filemode false
wget https://getcomposer.org/installer -O composer.phar
php composer.phar
php composer.phar install
chmod -R 755 *
chown -R www:www *
```

### 2.1伪静态

```nginx
location / {
    try_files $uri /index.php$is_args$args;
}
```

注意要修改root为 `/home/wwwroot/sspanel/public`

### 2.2强制https

```nginx
rewrite ^(.*)$  https://$host$1 permanent;
```

### 2.3创建并导入数据库

```mysql
mysql -u root -p
mysql>CREATE DATABASE 你的数据库名称;
mysql>use 你的数据库名称;
mysql>source /home/wwwroot/你的域名/sql/glzjin_all.sql;
mysql>exit
```

### 2.4 配置网站程序

```bash
cd /home/wwwroot/sspanel
cp config/.config.example.php config/.config.php
vim config/.config.php
```

### 2.5 创建管理员并同步用户

```bash
php xcat User createAdmin
php xcat Tool initQQWry
php xcat Tool initdownload
php xcat Tool setTelegram
```

如果创建管理员出错请检查 `config/.config.php` 中的数据库连接信息。

###  2.6配置定时任务

执行 `crontab -e` 命令, 添加以下四条：

```bash
30 22 * * * php /home/wwwroot/sspanel/xcat SendDiaryMail
0 0 * * * php -n /home/wwwroot/sspanel/xcat Job DailyJob
*/1 * * * * php /home/wwwroot/sspanel/xcat Job CheckJob
```

如果需要财务报表，可选添加以下三条：

```bash
5 0 * * * php /home/wwwroot/sspanel/xcat FinanceMail day
6 0 * * 0 php /home/wwwroot/sspanel/xcat FinanceMail week
7 0 1 * * php /home/wwwroot/sspanel/xcat FinanceMail month
```


# 其他设置

## 1.审计规则

如果需要自定义阻断页面的内容，请在每个后端目录下，复制 `detect.html` 为 `user-detect.html`，修改 `user-detect.html` 并重启后端。
