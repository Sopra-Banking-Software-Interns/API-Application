#reads input from the nation
while read lang
do 
echo $p
done < client_country.txt
#Creates a file and writes the output of the curl command to it
touch lang.txt
curl "https://restcountries.com/v3.1/name/india" | jq -r '.[].languages[]' > lang.txt
