#!/bin/bash
echo "run flashmob...(5 epoch)"
sh run_pagerank.sh
sh run_deepwalk.sh
echo "flashmob done!"
echo "passwd" |sudo -S swapoff -a
cd ~/ThunderRW
for ((i=1; i<=5; i++))
do
    build/random_walk/deepwalk.out -f sample_dataset/uk-union/ -nw 263144860 -l 80 -n 40 -em 0 -sm 0 2> result/DP_uk-union_2V_80step_epoch${i}.txt
    sleep 20
    build/random_walk/pagerank.out -f sample_dataset/uk-union/ -nw 263144860 -l 80 -n 40 -em 0 -sm 0 2> result/PR_uk-union_2V_80step_epoch${i}.txt
    sleep 20
    build/random_walk/ppr.out -f sample_dataset/uk-union/ -nw 263144860 -l 80 -n 40 -em 0 -sm 0 2> result/PPR_uk-union_2V_80step_epoch${i}.txt
    sleep 20
done

for ((i=1; i<=5; i++))
do
    build/random_walk/deepwalk.out -f sample_dataset/yahoo/ -nw 1307825408 -l 80 -n 40 -em 0 -sm 0 2> result/DP_yahoo_2V_80step_epoch${i}.txt
    sleep 20
    build/random_walk/ppr.out -f sample_dataset/yahoo/ -nw 1307825408 -l 80 -n 40 -em 0 -sm 0 2> result/PPR_yahoo_2V_80step_epoch${i}.txt
    sleep 20
done

for ((i=1; i<=3; i++))
do
    build/random_walk/pagerank.out -f sample_dataset/clueweb/ -nw 2 -l 80 -n 40 -em 0 -sm 0 2> result/PR_clueweb_2V_80step_epoch${i}.txt
    sleep 20
    build/random_walk/pagerank.out -f sample_dataset/yahoo/ -nw 1307825408 -l 80 -n 40 -em 0 -sm 0 2> result/PR_yahoo_2V_80step_epoch${i}.txt
    sleep 20
done

for ((i=4; i<=5; i++))
do
    build/random_walk/pagerank.out -f sample_dataset/clueweb/ -nw 2 -l 80 -n 40 -em 0 -sm 0 2> result/PR_clueweb_2V_80step_epoch${i}.txt
    sleep 20
    build/random_walk/pagerank.out -f sample_dataset/yahoo/ -nw 1307825408 -l 80 -n 40 -em 0 -sm 0 2> result/PR_yahoo_2V_80step_epoch${i}.txt
    sleep 20
done

echo "all jobs done!"

# cd ~/ThunderRW
# echo "run ThunderRW...(5 epoch)"
# sh run_ThunderRW.sh 
# echo "ThunderRW done!"
# sleep 30
# echo "run ThunderRW on clue and yahoo(2 epoch)"
# sh run_bigdataset.sh
# sh run_bigdataset2.sh
# echo "ThunderRW on yahoo and clueweb done!"
# # echo "start flashmob on yahoo and clueweb..."
# cd ~/flashmob



# echo "run flashmob on clue...(2 epoch)"
# build/bin/deepwalk -f binary -g /home/gpu/dataset/bel/clueweb.bel -e 2 -l 80 2> result/DP_clueweb_2V_80step_epoch1.txt
# sleep 20
# build/bin/deepwalk -f binary -g /home/gpu/dataset/bel/clueweb.bel -e 2 -l 80 2> result/DP_clueweb_2V_80step_epoch2.txt
# sleep 20
# build/bin/pagerank -f binary -g /home/gpu/dataset/bel/clueweb.bel -e 2 -l 80 --alpha 0.15 2> result/PR_clueweb_2V_80step_epoch1.txt
# sleep 20
# build/bin/pagerank -f binary -g /home/gpu/dataset/bel/clueweb.bel -e 2 -l 80 --alpha 0.15 2> result/PR_clueweb_2V_80step_epoch2.txt
# echo "flashmob on clue done!"

# echo "run flashmob on yahoo...(1 epoch)"
# sleep 20
# build/bin/deepwalk -f binary -g /home/gpu/dataset/bel/yahoo.bel -e 2 -l 80 2> result/DP_yahoo_2V_80step_epoch1.txt
# sleep 20
# build/bin/pagerank -f binary -g /home/gpu/dataset/bel/yahoo.bel -e 2 -l 80 --alpha 0.15 2> result/PR_yahoo_2V_80step_epoch1.txt
# sleep 20
# build/bin/deepwalk -f binary -g /home/gpu/dataset/bel/yahoo.bel -e 2 -l 80 2> result/DP_yahoo_2V_80step_epoch2.txt
# sleep 20
# build/bin/pagerank -f binary -g /home/gpu/dataset/bel/yahoo.bel -e 2 -l 80 --alpha 0.15 2> result/PR_yahoo_2V_80step_epoch2.txt

# echo "flashmob on yahoo done!"


