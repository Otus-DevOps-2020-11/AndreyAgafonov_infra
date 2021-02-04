#!/bin/bash
tempDir=/tmp/ansible
invFile=inv.json
function proverka {
echo "е обнаружено ни одного аргумена или количество аргументов больше 1! Для запуска используйте аргумент --list или --host <host_name>"
}

if [ $# = 0 ] || [ $# -gt 1 ]
then
printf "Н"
proverka
exit 1
fi

case "$1" in
 --list)
    command="list"
;;
 --host)
    command="host"
 ;;
 *)
    command="unknow"
    printf "Не верный аргумент, н"
    proverka
 exit 1
 ;;
esac

if [ $command = "host" ]
then
    echo "{"_meta": {"hostvars": {}}}"
    exit 0
fi

inventoryData=$(yc compute instance list --format json)
# get group list
groupList=$(echo  $inventoryData |jq .[].labels.ansible_group|sed 's/"//g')
result=''
### Понеслася!
for gi in  $groupList
do
    result=$result$(echo "["$gi"]")$'\n'

    hostsListInGroup=$(echo $inventoryData |jq --arg gi "$gi" '.[] | select(.labels.ansible_group == $gi)'|jq .name|sed 's/"//g')

    for srvs in  $hostsListInGroup
        do
            result=$result$(echo $srvs "ansible_host="$(echo $inventoryData| jq --arg srvs "$srvs" '.[] | select(.name == $srvs)' | jq .network_interfaces[0].primary_v4_address.one_to_one_nat.address|sed 's/"//g'))$'\n'
        done

done

if [ ! -d $tempDir ]
then
mkdir -p /tmp/ansible
fi
echo "$result"  > $tempDir/$invFile

ansible-inventory -i $tempDir/$invFile --list

rm -fr $tempDir
