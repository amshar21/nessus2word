echo "./hostvaMain.sh file.nessus critical,high,medium,low"

if [ ! -f nessus.csv ]; then
rm nessus.csv
fi

#severity level parser
filter1=$(echo $2 |cut -d, -f1)
filter2=$(echo $2 |cut -d, -f2)
filter3=$(echo $2 |cut -d, -f3)
filter4=$(echo $2 |cut -d, -f4)

if [ -z "$filter1" ]
then
      echo "- The 2nd paramter has no , delimiter"
      exit
else
      placeh0lder=$(echo grep -e \""\^$filter1\^"\" nessus2.csv \| sort)
fi

if [ -z "$filter2" ]
then
      echo "- 2nd filter not specified"
else
      placeh0lder=$(echo grep -e \""\^$filter1\^"\" -e \""\^$filter2\^"\" nessus2.csv \| sort)
fi

if [ -z "$filter3" ]
then
      echo "- 3rd filter not specified"
else
      placeh0lder=$(echo grep -e \""\^$filter1\^"\" -e \""\^$filter2\^"\" -e \""\^$filter3\^"\" nessus2.csv \| sort)
fi

if [ -z "$filter4" ]
then
      echo "- 4th filter not specified"
else
      placeh0lder=$(echo grep -e \""\^$filter1\^"\" -e \""\^$filter2\^"\" -e \""\^$filter3\^"\" -e \""\^$filter4\^"\" nessus2.csv \| sort)
fi

#echo "$placeh0lder"
#severity level parser

echo - Converting .nesssus to csv
python nes2csv.py $1
cut -d\" -f4,12,18,20 --output-delimiter \^ nessus.csv | sed -n 2,999999p > nessus2.csv
echo "$placeh0lder" > grepper.sh
chmod +x grepper.sh
echo - Filtering out serverity
./grepper.sh > nessus3.csv
#$(echo $placeh0lder)
echo - Merging final Tuple
./hostvaTuple.sh nessus3.csv hostvaTupleMiddle.py
cat hostvaTupleHead.py > hostvaTupleFinal.py
cat hostvaTupleMiddle.py >> hostvaTupleFinal.py
cat hostvaTupleTail.py >> hostvaTupleFinal.py
echo - Generating report
python3 hostvaTupleFinal.py hostvaReport.docx
echo " "
