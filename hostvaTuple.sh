#!/bin/bash

echo "- Host VA python tuple generator and merger"
#echo "./hostvaTuple.sh hostvaCsv.csv hostvaTupleMiddle.py"
echo "./hostvaTuple.sh input output"

itemcount=0

echo "records = (" > $2
#echo "records = ("

while IFS='' read -r line || [[ -n "$line" ]]; do
itemcount=$((itemcount + 1))
param1=$(echo "$line" | cut -d\^ -f1)
#echo "$param1"
param2=$(echo "$line" | cut -d\^ -f2 | sed "s/'/\\\'/g")
#echo "$param2"
param3=$(echo "$line" | cut -d\^ -f3)
#echo "$param3"
param4=$(echo "$line" | cut -d\^ -f4 | sed "s/'/\\\'/g")
#echo "$param4"
echo "    ($itemcount, 'VA-$itemcount', '$param1', '$param2', '$param3', '$param4')," >> $2
#echo "    ($itemcount, 'VA-$itemcount', '$param1', '$param2', '$param3', '$param4'),"
done < "$1"

echo ")" >> $2
#echo ")"

#echo "records = ("
#echo "    (1, 'WA-\'001', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE'),"
#echo "    (2, 'WA-002', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE'),"
#echo "    (3, 'WA-003', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE')"
#echo ")"

echo " "
