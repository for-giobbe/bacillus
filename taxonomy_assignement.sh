for i in $(awk -F "\t" '{print $1}' $1 | sort -u);

	do

        a=$(grep $i $1 | awk -F "\t" '{print $(NF-1)" "$NF}' | sort -g | head -20 | awk '{print $NF}');

	echo $a | sed "s/ /\n/g" | sed "s/;/\n/g" > $1"tmp.taxon.lst";

 cat $1"tmp.taxon.lst"

taxonkit lineage $1"tmp.taxon.lst" > $1"tmp.lineage.lst" ;

 cat $1"tmp.lineage.lst"

	tot=$(wc -l $1"tmp.lineage.lst" | awk '{print $1}');

	if [[ $(grep -c Arthropoda $1"tmp.lineage.lst") -le $((tot / 2)) ]];

		then echo $i >> $2;

		else echo $i >> $3;

	fi;

done

echo "contaminants" >> $2
echo "insects" >> $3

