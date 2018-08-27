#IF-THEN-else statement
echo "enter source and target file names:"
read source target
if mv $source $target
then
echo "your file has been successfully renamed"
else
echo "your filename entered is wrong"
fi
ls -lrt $target
