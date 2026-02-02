#!/bin/sh

# need to install git and rsync

# update local with remote contenr
git push

# sync notes with website repository folder
rsync -av --delete ~/Notes/LucasBoscaini.com/Content/ content/

# send content to remote
git add content
git commit -m 'sync content at '
git push
