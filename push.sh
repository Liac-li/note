#!/bin/bash

DATE_msg=$(date +'%Y %b %d')
Add_msg=$1
REMOTES="origin github nju-git"
echo "$DATE_msg"

git add ./

if [ -z "$Add_msg" ]; then
	git commit -m "Update: $DATE_msg" --allow-empty
else
	git commit -m "Update: $DATE_msg -- $Add_msg" --allow-empty
fi

for re in $REMOTES
do 
	git push "$re"
done
# git push origin master
