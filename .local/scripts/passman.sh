#!/bin/sh

set -e

# prompt list of passwords
dmenu="dmenu -p 'Choose a pass:' -l 10"

prefix=${PASSWORD_STORE_DIR-~/.password-store}
passwords=$(find "$prefix" -type f -name '*.gpg' | sed "s|^$prefix/||; s|\.gpg$||")

# get user choice of password
password=$(printf '%s\n' "$passwords" | eval "$dmenu" )

# get password info from pass program
password_info=$(pass "$password")

password_info_fields=$(echo "$password_info" | awk 'NR==1 {print "password" } NR>1 {print $1}' | sed 's/://')

chosen_field=$(echo "$password_info_fields" | eval "$dmenu")

result=$(pass show "$password" | grep "$chosen_field" | sed "s/$chosen_field: //")

# password field is chosen
if [ -z "$result" ]; then
   result=$(pass show "$password" | awk 'NR==1')
fi

clipctl disable
echo "$result" | xclip -sel clip
clipctl enable

