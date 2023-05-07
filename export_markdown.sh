#!/bin/bash

number=1

ls files/* | while read file
do
    title=`echo "$file" | sed 's/^files\///'`

    echo
    echo "## $title"
    echo
    cat "$file" | sed 's/$/\n/' | nl --starting-line-number=$number --number-format=rz --number-width=5
    
    file_line_no=`wc "$file" | awk '{print $1}'`
    number=$[number+file_line_no+1]    
done
