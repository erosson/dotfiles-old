#!/bin/sh -eu
git config --global core.editor vim
git config --global push.followTags true
git config --global user.name 'Evan'
# rot13 email, because spambots. http://stackoverflow.com/questions/5442436/using-rot13-and-tr-command-for-having-an-encrypted-email-address
git config --global user.email `echo tvguho@rebffba.bet | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'` 
