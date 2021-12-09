#!/bin/bash

dataset=~/dataset/soc-LiveJournal1.el
walkers=100000000
length=10

build/bin/deepwalk -f text -g  $dataset -w $walkers -l $length