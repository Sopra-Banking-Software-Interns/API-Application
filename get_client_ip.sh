client_data=$(curl -s https://api.bigdatacloud.net/data/client-ip)
client_ip=$(echo "$client_data" | jq -r .ipString)
echo "$client_ip">>client_ip.txt