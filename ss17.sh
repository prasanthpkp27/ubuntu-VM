echo "enter file name:\c"
read fname
if [ -f $fname ]
then
	if [ -w $fname ]
	then
		echo "type matter to append. To quit press ctrl+d"
		cat >> $fname
	else
		echo "you don't have permission to write"
	fi
fi
