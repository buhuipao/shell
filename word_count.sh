#!/bin/bash
# word_count.sh

if [$# -ne 1]
then 
  echo "Usage: $0 filename !"
  exit -1
fi

egrep -o  "\w+" $1 | \
  awk '{count[$0]++;}
        END{ printf("%-20s%-10s\n","word","number");
        for (var in count)
          {printf("%-20s%-5d\n",var,count[var]);}
          }'
