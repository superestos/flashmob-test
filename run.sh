#!/bin/bash

dataset=~/dataset/bel/soc-LiveJournal1.bel
walkers=100000000
length=10

build/bin/deepwalk -f binary -g  $dataset -w $walkers -l $length