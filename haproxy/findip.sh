

until mysql -h${MASTER_HOST} -uroot -p$MYSQL_ROOT_PASSWORD -e "select 1 from dual" | grep -q 1;
do
    >&2 echo " ==========================================================FIND IP master is unavailable - sleeping===================================="
    sleep 1
done
>&2 echo " master is up - setting slave"
echo "==========================================================FIND IP===================================="
mysql -h${MASTER_HOST} -uroot -p$MYSQL_ROOT_PASSWORD -e "SELECT * FROM information_schema.PROCESSLIST AS p WHERE p.COMMAND = 'Binlog Dump';"
