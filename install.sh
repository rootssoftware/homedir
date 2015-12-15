#!/bin/bash

BAK=~/.homedir_backup_`date +%Y%m%d%H%M`
HERE=`pwd`
HOMEDIR=$HERE/homedir

mkdir $BAK
cd $HOMEDIR
git update-index --assume-unchanged README.md
git update-index --assume-unchanged install.sh
rm README.md
rm install.sh
for file in `ls -A`
do
	mv ~/$file $BAK/ > /dev/null 2>&1
done
mv `ls -A` ~/
cd $BAK
echo "Moved existing files to $BAK:"
ls -A
cd $HERE
rmdir $HOMEDIR
echo "Done!"
