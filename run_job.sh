#!/bin/bash
seed1=${1}
seed2=${2}
seed=$(((seed1*1000)+seed2))
seed=$((seed % (30081*30081)))
echo "Sub task started ${seed}"

events=10000 # recommend one job 10k, you can start more jobs in submit.job

detector=delphes_card_ATLAS_PileUp.tcl
pileup=50
./run.sh vbf_pileup50 vbf.mg5 vbf.pythia       ${detector} ${seed} ${events} ${pileup} &
./run.sh dijet_pileup50 dijet.mg5 dijet.pythia ${detector} ${seed} ${events} ${pileup} &
./run.sh ttbar_pileup50 ttbar.mg5 ttbar.pythia ${detector} ${seed} ${events} ${pileup} &

# ... more processes and other setup...
# detector=delphes_card_ATLAS_PileUp.tcl
# pileup=100
# ./run.sh vbf_pileup100 vbf.mg5 vbf.pythia       ${detector} ${seed} ${events} ${pileup}
# ./run.sh dijet_pileup100 dijet.mg5 dijet.pythia ${detector} ${seed} ${events} ${pileup}
# ./run.sh ttbar_pileup100 ttbar.mg5 ttbar.pythia ${detector} ${seed} ${events} ${pileup}

wait $(jobs -p)