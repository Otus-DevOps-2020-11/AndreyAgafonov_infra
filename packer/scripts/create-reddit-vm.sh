#!/bin/bash
ya_zone="ru-central1-c"
ya_sub_net_id="b0coclf2t4vqo8bpua85"
ya_image_id="fd8pa3bmio9agfd3iu36"
ya_machine_name="reddit-full"

yc compute instance create \
--name $ya_machine_name \
--zone $ya_zone \
--create-boot-disk type=network-ssd,image-id=$ya_image_id \
--cores 2 \
--core-fraction 5 \
--memory 2 \
--network-interface subnet-id=$ya_sub_net_id,nat-ip-version=ipv4 \
--platform=standard-v1


echo -e "\e[1;32m For result - see URL:"
echo -e "\e[1;32m http://"$(yc compute instance get $ya_machine_name --format json |jq -r '.network_interfaces[0].primary_v4_address.one_to_one_nat.address')":9292"
tput sgr0
