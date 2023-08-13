#!/bin/bash

function JobFin {
    if [ $1 -eq 2 ]; then
        echo ""
        echo "Done!"
        echo ""
    else    
        echo "Done!"
        echo ""
    fi    
}

function ExtractHosts {
    echo "Clearing the hosts file..."
    > hosts
    echo "The hosts file is now empty."
    echo ""
    echo "Saving a list of nodes into the hosts file..."

    while read LINE; do
        echo $LINE | grep -E -o '\b(?!127\.)[0-9]{1,3}(\.[0-9]{1,3}){3}\b' >> hosts
        # echo $LINE | grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}' >> hosts
        printf "▓"
    done < load

    JobFin 2
    echo "Copying the content from load to loadlast"
    cat load > loadlast
    JobFin 1
    echo "Deleting the load file..."
    rm load
    JobFin 1
    echo "Removing possible duplicates..."
    sort -u -o hosts hosts
    JobFin 1

    cat hosts | tr "\n" "," < hosts | sed 's/[,]$//' > hostcom && printf "\n" >> hostcom
    cat hosts | tr "\n" " " < hosts | sed 's/[,]$//' > chost && printf "\n" >> chost
}

function CheckHosts {
    echo "Checking the content of the hosts file:"
    cat hosts
    NODES=$(wc -l < hosts)
    if [ $NODES -eq 0 ]; then
        echo "The hosts file is empty"
    elif [ $NODES -eq 1 ]; then
        echo "There is 1 node in the hosts file."
    elif [ $NODES -ge 2 ]; then
        echo "There are $NODES nodes in the hosts file"
    fi
}

# Check if 'load' file exists, extract hosts, and check them
if [ -e 'load' ]; then
    ExtractHosts 
    CheckHosts
else
    > load && nano load && $0
fi
