FROM xkvnn/haproxy
ENV MASTER_HOST=master_001
ENV MYSQL_ROOT_PASSWORD=123456
COPY haproxy_mysql.cfg /haproxy.cfg
COPY filetmp /filetmp
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
