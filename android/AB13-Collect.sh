#!/bin/sh

datascrpt=ABData

t=N2-USMC
n=4
v=B

printf "connect ${n}${v}-${t} > "
read go
if [ "${go}" == "y" ]
then
    mkdir ${n}${v}-${t}
    cd ${n}${v}-${t}
    ${datascrpt}
    cd ..
fi
 

for t in N2 N8
do
    for n in 4 5
    do
        for v in A B C
        do
            printf "connect ${n}${v}-${t} > "
            read go
            if [ "${go}" == "y" ]
            then
                mkdir ${n}${v}-${t}
                cd ${n}${v}-${t}
                ${datascrpt}
                cd ..
            fi
        done
    done
done
