#!/bin/bash

set -e
shopt -s nullglob globstar

# prompt list of passwords
dmenu="dmenu \-p \"Choose a pass:\" -l 10 "

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

# get user choice of password
password=$(printf '%s\n' "${password_files[@]}" | eval "$dmenu" )

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

