#/bin/bash

DATE_msg=$(date +'%Y %b %d')
Add_msg=$1
echo "$DATE_msg"

git add ./

if [ -z "$Add_msg" ]; then
	git commit -m "Update: $DATE_msg" --allow-empty
else
	git commit -m "Update: $DATE_msg -- $Add_msg" --allow-empty
fi

git push origin master

