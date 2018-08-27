#Run checks on files
echo "enter a name:\c"
read fname
if [ -f $fname ]
then 
echo " you indeed entered a file name"
else
echo " Don't provide me crazy inputs"
fi
