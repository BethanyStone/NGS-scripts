#!/bin/bash
set -eu

# usage
if [ "$#" -lt 4 ]; then
echo "Missing required arguments!"
echo "USAGE: FASTA_seq_extraction.sh <Fasta_file>"
fi

Fasta=$1

### Create variable for chromosome numbers
Chr=$(grep -o -E "^>\w+" $1 | tr -d ">")

### Extract fasta sequences for each chromosome
for i in $Chr; do 
    awk -v P="${i}" '$0~P' RS='>' Athaliana_447_TAIR10.fa > Athaliana_447_TAIR10_${i}.fa;
done