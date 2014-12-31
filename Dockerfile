FROM adeo/testlink:latest

# adeo/testlink 的数据库用户/密码设置有误，直接用 root
ADD config_db.inc.php /app/testlink/config_db.inc.php

# 用 root 有安全问题，关闭 testlink 的报警
RUN sed -i  "s/'FILE';/'SILENT';/" testlink/config.inc.php

CMD ["/run.sh"]
