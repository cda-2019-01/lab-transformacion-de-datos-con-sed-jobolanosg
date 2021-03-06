# Escriba su código aquí
sed -r 's/([0-9]*)\/([0-9]*)\/([0-9]*)/\1-\2-\3/g' data.csv > data_temp1.csv
sed -r 's/([0-9])\-([0-9])\-([0-9][0-9])/0\1-0\2-\3/g' data_temp1.csv > data_temp2.csv
sed -r 's/([0-9]*)\-([0-9]*)\-([0-9][0-9];)/\1-\2-20\3/g' data_temp2.csv > data_temp3.csv
sed -r 's/([0-9]*)\-([0-9]*)\-([0-9]*)/\3-\2-\1/g' data_temp3.csv > data_temp4.csv
tr  '[:lower:]' '[:upper:]' < data_temp4.csv > data_temp5.csv
sed 's/;\([N]\);/;\\N;/g' data_temp5.csv > data_temp6.csv
sed 's/;\([N]\)/;\\N/g' data_temp6.csv > data_temp7.csv
sed 's/;;/;\\N;/g' data_temp7.csv > data_temp8.csv
sed 's/;$/;\\N/g' data_temp8.csv > data_temp9.csv
sed 's/;/,/g' data_temp9.csv > data_temp10.csv
sed -r 's/([0-9]{3})\,([0-9])/\1.\2/g' data_temp10.csv > data_temp11.csv
cat data_temp11.csv
rm data_temp*
