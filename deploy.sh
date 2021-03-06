#!/bin/sh
set -e
DEPLOY="/home/cypher"

# Preferably separate commits but this ensures changes are pushed
git commit -a || true
git pull
git push

rsync -rcvz --delete --exclude='.git*' --exclude='.zfs' \
	--exclude='deploy.sh' --exclude='README.md' --exclude='CNAME' \
	./ "bg3.cs.wm.edu:$DEPLOY/"
