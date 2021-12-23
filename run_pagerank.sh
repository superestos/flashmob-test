#!/bin/bash

app=build/bin/pagerank
alpha=0.15
datapath=~/dataset/bel
declare -a dataset=(friendster uk-union yahoo)
#declare -a dataset=(uk-union friendster)

for ((i=0; i<${#dataset[@]}; i++))
do
    echo "start pagerank on ${dataset[$i]}"
    for ((j=10; j<=10; j=j+2)); #walker num j*|V|  
    do
        for ((k=4; k<=4; k++)); 
        do
            for ((epoch=1; epoch<=5; epoch++));
            do
                cmd="${app} -f binary -g ${datapath}/${dataset[$i]}.bel -e ${j} -l $((20*k)) --alpha ${alpha} 2> result/PR_${dataset[$i]}_${j}V_$((20*k))step_epoch${epoch}.txt"
                echo "${cmd}"
                eval "${cmd}"
            done
        done
    done
done  

