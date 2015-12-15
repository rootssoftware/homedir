#!/bin/bash

BAK=~/.homedir_backup_`date +%Y%m%d`
HERE=`pwd`
HOMEDIR=$HERE/homedir

mkdir $BAK
cd $HOMEDIR
git update-index --assume-unchanged README.md
git update-index --assume-unchanged install.sh
rm README.md
rm install.sh
for file in .* *
do
	mv ~/$file $BAK/
done
cd $BAK
echo "Moved existing files to $BAK:"
ls -a
cd $HERE
mv $HOMEDIR/.* $HOMEDIR/* ~/
rmdir $HOMEDIR
echo "Done!"
