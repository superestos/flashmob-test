#!/bin/bash

#dataset=~/dataset/bel/livejournal.bel
#dataset=~/dataset/bel/friendster.bel
#dataset=~/dataset/bel/uk-union.bel
#dataset=~/dataset/txt/soc-LiveJournal1.el

#walkers=100000000
#length=10

#build/bin/deepwalk -f binary -g  $dataset -w $walkers -l $length --mem 75
#build/bin/pagerank -f binary -g  $dataset -w $walkers -l $length --alpha 0.15
#build/bin/deepwalk -f binary -g  $dataset -w $walkers -l $length

#build/bin/ppr -f binary -g  $dataset -w $walkers -l $length --alpha 0.15
#build/bin/deepwalk -f binary -g  $dataset -e 10 -l $length 

app=build/bin/deepwalk
datapath=~/dataset/bel

declare -a dataset=(yahoo)

for ((i=0; i<${#dataset[@]}; i++))
do
    echo "start deepwalk on ${dataset[$i]}"
    for ((j=10; j<=10; j=j+2)); #walker num 10*|V| 
    do
        for ((k=4; k<=4; k++)); #5
        do
            for ((epoch=1; epoch<=5; epoch++));
            do
                cmd="${app} -f binary -g ${datapath}/${dataset[$i]}.bel -e ${j} -l $((20*k)) 2> result/DP_${dataset[$i]}_${j}V_$((20*k))step_epoch${epoch}.txt"
                echo "${cmd}"
                eval "${cmd}"
            done
        done
    done
done  

