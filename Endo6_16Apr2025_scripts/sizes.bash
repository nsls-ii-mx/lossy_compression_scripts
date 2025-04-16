#!/bin/bash
dir=$1
echo `ls $dir | wc -l` files in $dir
echo `du -sb $dir` characters in $dir
echo `tar cf - $dir | zstd -6 | wc -c` characters in zstd_6 $dir
