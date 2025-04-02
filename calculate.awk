awk 'BEGIN {
    printf "Enter the full directory file name: ";
    getline file < "-";
    print file;
}'
'{print NR ": " $0'}' file
'{print NR ": " $1'}' file 
'{ sum += $2; print "The sum of the column is: ", sum}' file
END { 
    print "Thank you"
}

