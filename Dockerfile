FROM adeo/testlink:latest

# adeo/testlink 的数据库用户/密码设置有误，直接用 root
ADD config_db.inc.php /app/testlink/config_db.inc.php

# 用 root 有安全问题，关闭 testlink 的报警
RUN sed -i  "s/'FILE';/'SILENT';/" testlink/config.inc.php

# htaccss 不允许读 cfg 目录的文件，但这会导致编辑器无法使用，故删除
RUN rm /var/www/html/testlink/cfg/.htaccess

CMD ["/run.sh"]
