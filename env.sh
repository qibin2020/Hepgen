. /cvmfs/sft.cern.ch/lcg/views/LCG_105/x86_64-el9-gcc13-opt/setup.sh
export DISPLAY=
export STARTDIR=${PWD}
mkdir -p logs jobs
# replace the following!!!
export LOCALMG5=PATH_TO_MADGRAPH5_DIR/
export PILEUP_FILE=PATH_TO_PILEUP_FILE.pileup
#
export PYTHIA8DATA=${LOCALMG5}/HEPTools/pythia8/share/Pythia8/xmldoc
export MG5_PROG=${LOCALMG5}/bin/mg5_aMC
export DELPHES_PROG=${LOCALMG5}/Delphes/DelphesHepMC2
