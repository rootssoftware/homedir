for f in `svn log | grep "^r[0-9]* | $1" | cut -c 2- | awk '{print $1}'`
do
	echo renaming author of $f to $2
	svn propset --revprop -r $f svn:author $2
done
