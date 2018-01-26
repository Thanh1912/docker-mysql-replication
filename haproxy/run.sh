#!/bin/bash
# health check
echo "============================================ 1 master is up - setting slave===================="
until mysql -h${MASTER_HOST} -uroot -p$MYSQL_ROOT_PASSWORD -e "select 1 from dual" | grep -q 1;
do
    >&2 echo " master is unavailable - sleeping"
    sleep 1
done
>&2 echo " master is up - setting *(*****HAPROXY*****)"
#init value
isChange=0
IpSaved=""

while [ 1 -gt 0 ]
do
echo "================.**(.....RELOADNGING.......)*****============"
result=`mysql -h${MASTER_HOST} -uroot -p$MYSQL_ROOT_PASSWORD -e "SELECT host FROM information_schema.PROCESSLIST AS p WHERE p.COMMAND = 'Binlog Dump';"`
items=$(echo $result | tr " " "\n")
i=0
insert_str=""
IpCurrent=0

for item in $items
do
    if [ $i -gt 0 ]
    then
    ip=$( echo "$item" |cut -d\: -f1 )
	insert_str=$insert_str" server ${ip} ${ip}:3306 check \n"
	IpCurrent=$insert_str
	fi
	i=${i+1}
done
 echo ******* ipsave $IpSaved \n--- nipcur $IpCurrent--\n ischange= $isChange
if [ "$IpSaved" != "$IpCurrent"  ]
then
       echo changed
        isChange=1
 fi
 echo \n ischange= $isChange
  if [ $isChange -eq 1 ]
  then
    IpSaved=${IpCurrent}
    echo changed $IpSaved
    echo "$(cat filetmp)\n $insert_str" > /haproxy.cfg
    cat /haproxy.cfg
    haproxy -f /haproxy.cfg -D
    isChange=0
  fi
sleep 5
done




