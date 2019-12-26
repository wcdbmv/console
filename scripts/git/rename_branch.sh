#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Usage: rename_branch <old_name> <new_name>"
	exit 1
fi

readonly old_name=$1
readonly new_name=$2

set -euxo pipefail

git branch -m $old_name $new_name
git push origin :$old_name $new_name
