MASTER_HOST=172.18.0.2
MYSQL_ROOT_PASSWORD=123456
echo "==========================================================FIND IP===================================="
result=`mysql -h${MASTER_HOST} -uroot -p$MYSQL_ROOT_PASSWORD -e "SELECT host FROM information_schema.PROCESSLIST AS p WHERE p.COMMAND = 'Binlog Dump';"`
echo $result
echo ==============
items=$(echo $result | tr " " "\n")
i=0
listIp=[]
insert_str=""
for item in $items
do
    if [ $i -gt 0 ]
    then
    IFS=': ' read -r -a array <<< "$item"
	listIp[i]=${array[0]}
	insert_str=$insert_str" server mysql${i} ${array[0]} :3306 check \n"
	fi
	i=${i+1}
done
echo -e "\n$(cat filetmp)\n $insert_str" > filedemo
cat filedemo | while read LINE
do
echo $LINE
done




