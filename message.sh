iso_file="langer.txt"
touch message.txt
echo -n "">message.txt
linenumber=$(sed -n '$=' lang.txt)
#echo $linenumber
for (( x=1; x<=$linenumber; x++ ))
do
linew=$(sed -n "${x}p" lang.txt)
echo $linew
echo $x
# r="$line"
# echo $r
curr=$("awk" -F'\t' -v lang="$linew" '$3==lang {print $2; exit}' "$iso_file")
if [[ $curr == " " ]] 
then 
curr=$("awk" -F'\t' -v lang="$linew" '$3==lang {print $1; exit}' "$iso_file")
fi  
echo $curr>>message.txt
# (( x++ ))
# echo $x
done < lang.txt


linenumber=$(sed -n '$=' message.txt)
echo $linenumber
TEXT="HELLO"
echo -n "">langoutput.txt
for (( x=1; x<=$linenumber; x++ ))
do
linew=$(sed -n "${x}p" message.txt)
pur=$(curl --request POST \
	--url https://google-translate1.p.rapidapi.com/language/translate/v2 \
	--compressed \
	--header 'Accept-Encoding: application/gzip' \
	--header 'X-RapidAPI-Host: google-translate1.p.rapidapi.com' \
	--header 'X-RapidAPI-Key: ${{ secrets.RAPID_KEY}}' \
	--header 'content-type: application/x-www-form-urlencoded' \
	--data q="Hello" \
	--data target="$linew" \
	--data source=en)
echo "$pur | jq -r '. | .data.translations[0].translatedText'"
done
rm message.txt
