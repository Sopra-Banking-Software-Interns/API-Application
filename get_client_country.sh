#execute this script to update the client's country in client_country.txt
client_data=$(curl -s https://api.bigdatacloud.net/data/client-ip)
client_ip=$(echo "$client_data" | jq -r .ipString)
country=$(curl -s "https://api.country.is/$client_ip")
country=$(echo $"$country" | jq -r .country)
iso_file="iso_3166-2_data.txt"
country_name=$(awk -F',' -v code="$country" '$9==code {print $1; exit}' "$iso_file")
echo $country_name>client_country.txt