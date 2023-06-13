#execute this script to update the client_ip in client_ip.txt
client_data=$(curl -s https://api.bigdatacloud.net/data/client-ip)
client_ip=$(echo "$client_data" | jq -r .ipString)
echo "$client_ip">>client_ip.txt