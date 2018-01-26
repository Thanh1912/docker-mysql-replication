# health check
echo "============================================ 1 master is up - setting slave===================="
until mysql -h${MASTER_HOST} -uroot -p$MYSQL_ROOT_PASSWORD -e "select 1 from dual" | grep -q 1;
do
    >&2 echo " master is unavailable - sleeping"
    sleep 1
done
>&2 echo " master is up - setting slave"


echo "============================================ DANG LOAD LAI===================="
haproxy -f /haproxy.cfg




