#!/bin/bash
name=${1}
mg5_card=${2}
pythia_card=${3}
det_card=${4}
seed=${5:-0}
events=${6:-1000}
mu=${7:-50}

echo "Start ${@}"

. ./env.sh
cd jobs

mkdir ${name}_${seed} || exit 1
cd ${name}_${seed} || exit 1
cp ${STARTDIR}/config/mg5_template.cmnd run.cmd
sed -i "s#<SEED>#${seed}#g" run.cmd
sed -i "s#<NEVT>#${events}#g" run.cmd
PROC=$(cat ${STARTDIR}/process/${mg5_card})
awk -v repl="$PROC" '{gsub(/<PROC>/, repl)}1' run.cmd > temp && mv temp run.cmd
sed -i '/^\s*$/d' run.cmd

cp ${STARTDIR}/config/pythia_template.cmnd pythia8.cmd
sed -i "s#<NEVT>#${events}#g" pythia8.cmd
SHOWER=$(cat ${STARTDIR}/process/${pythia_card})
awk -v repl="$SHOWER" '{gsub(/<SHOWER>/, repl)}1' pythia8.cmd > temp && mv temp pythia8.cmd
sed -i '/^\s*$/d' pythia8.cmd

cp ${STARTDIR}/detector/${det_card} delphes.tcl
sed -i "s#<PILEUP>#${PILEUP_FILE}#g" delphes.tcl
sed -i "s#<MU>#${mu}#g" delphes.tcl

# ok copy the zero pileup one
cp ${STARTDIR}/detector/ATLAS_PileUpZero_10deg_antiKt06.tcl delphes_0.tcl

time ${MG5_PROG} run.cmd
mv ${PWD}/generation/Events/run_01/tag_1_pythia8_events.hepmc.gz ${name}_${seed}.hepmc.gz
gzip -dc ${name}_${seed}.hepmc.gz | ${DELPHES_PROG} delphes.tcl ${name}_${seed}.root -
gzip -dc ${name}_${seed}.hepmc.gz | ${DELPHES_PROG} delphes_0.tcl ${name}_${seed}.PileUpZero.root -

tar czf ${name}_${seed}.tar.gz generation && rm -rf generation
