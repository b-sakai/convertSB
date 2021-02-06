cd getFCWBswcs/
Rscript convertJFRC2toFCWB.r glomName.name
cd ../convertFCWBtoFBTBF
python convertFCWBtoFBTBF.py
cd ..
echo "converted swc files in convertFCWBtoFBTBF/fbtbf/"
