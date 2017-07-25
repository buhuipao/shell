#!/bin/bash
# remove_duplicates.sh
ls -1S -l /home/buhuipao/SHELL2/3  | gawk 'BEGIN {
getline;getline;
name1=$9; size1=$5
}
{
  name2=$9;size2=$5
  if (size1==size2)
    {
     "md5sum "name1 | getline; csum1=$1;
     "md5sum "name2 | getline; csum2=$1;
	if ( csum1==csum2 )
	{
		print name1; print name2;
	}
    };
    
    size1=size2;name1=name2;
}'  > duplicate_files

 print "^"$2"$" }' |sort -u > duplicate_sample
echo Removing...
comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr # | xargs rm -i 
echo Removed duplicate files successfully.
