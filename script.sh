# Escriba su código aquí
echo '-----------------------------------------'
echo '•	Data inicial'
echo '-----------------------------------------'
cat data.csv
echo '-------------------------------------------------------------------'
echo '•	Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD'
echo '------------------------------------------------------------------'
sed -r 's/([0-9]{2})\/([0-9]{2})\/([0-9]{2})/\1-\2-\3/g' data.csv > data_temp1.csv
sed -r 's/([0-9]{2})\-([0-9]{2})\-([0-9]{2})/20\3-\2-\1/g' data_temp1.csv > data_temp2.csv
cat data2.csv
echo '---------------------------------------------------------------------------'
echo '•	Transforme el archivo para que todos los campos nulos aparezcan como \N'
echo '---------------------------------------------------------------------------'
sed 's/;\([N]\);/;\\N;/g' data_temp2.csv > data_temp3.csv
sed 's/;\([N]\)/;\\N/g' data_temp3.csv > data_temp4.csv
cat data_temp4.csv
echo '-----------------------------------------'
echo '•	Reemplace los ; por ,'
echo '-----------------------------------------'
sed 's/;/,/g' data_temp4.csv > data_temp5.csv
cat data_temp5.csv
echo '-----------------------------------------'
echo '•	Use el . para indicar decimales'
echo '-----------------------------------------'
sed -r 's/([0-9]{3})\,([0-9])/\1.\2/g' data_temp5.csv > data_temp6.csv
cat data_temp6.csv
echo '--------------------------------------------------------'
echo '•	Extraiga los registros que no tienen campos nulos'
echo '---------------------------------------------------------'
sed '/\N/d' data_temp6.csv > data_temp7.csv
cat data_temp7.csv
echo '-----------------------------------------'
rm data_temp*
