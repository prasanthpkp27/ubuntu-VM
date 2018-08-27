#IF-THEN statement
echo "enter source and target file names:"
read source target
if mv $source $target
then
echo "your file has been successfully renamed"
fi
ls -lrt $target
