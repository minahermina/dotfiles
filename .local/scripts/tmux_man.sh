#!/bin/bash
man -k . | awk '{ print $2 " "  $1}' | sed 's/[()]//g' | fzf --preview='man {1} {2}'  | man $(cat /dev/fd/0)
