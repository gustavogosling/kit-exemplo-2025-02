for i in $1/*.csv
do
    tail -n +7 $i | wc -l 
done
tail -n +7 $1/*.csv | wc -l