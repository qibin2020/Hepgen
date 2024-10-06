. /cvmfs/sft.cern.ch/lcg/views/LCG_102b/x86_64-centos7-gcc11-opt/setup.sh
# replace the following!!!
export LOCALDELPHES=/lustre/collider/liuqibin/Project_MET/generation/delphes-master
#
export HAS_PYTHIA8=true
export DISPLAY=
export DELPHES_PATH=${LOCALDELPHES}
export PATH=${DELPHES_PATH}:$PATH
