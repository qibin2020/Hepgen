Toolset for HEP generation
=====
For question: qibin.liu@cern.ch
# install the environment
We recommend to pick one lcg environemtn oin cvmfs for root and other depedencies and install madgraph + delphes locally
- pick one lcg environment:
where `xxx` is lcg version, we recommend `102b`(for old system) or `105`(for newer one)
```
# list all system supported, pick the one match your system.
ls /cvmfs/sft.cern.ch/lcg/views/LCG_xxx/x86_64-*-opt/setup.sh
# pick one and load with
. /cvmfs/sft.cern.ch/lcg/views/LCG_xxx/x86_64-yyy-opt/setup.sh
```

- install madgraph and delphes, pythia inside. 
refer to madgraph homepage. Remeber to `install Delphes Pythia8` inside the MG5

- install the `standalone Delphes` (optional, only for pileup file)
This need only once to generate the pileup file, after that this installation could be removed. The delphes should be compiled with pythia. See `special_env.sh` in `pileup` folder.
Alternatively you can download the pielup file directly and this section is not needed.

# Modification to local environment
Check the file `env.sh` and replace to your local madgraph installation path and pileup file path.

Also, remeber to replace the lcg environment as mentioned before.

For the pileup: please refer to the folder `pileup` and readme there if generate by yourself, or download existing one.

# Check the config, detector and process defination
templates hosted in `config`: not recommended to change

detector stored in `detector`: not recommended to change
- `ATLAS_PileUp_10deg_antiKt06.tcl`: with variable Pileup. (10degree for all eta slice)
- `ATLAS_PileUpZero_10deg_antiKt06.tcl`: with no pileup and pileup removal algorithm disabled. (10degree for all eta slice)
- `delphes_card_ATLAS_PileUp.tcl`: original card shipped with Delphes. For reference.
- `delphes_card_ATLAS.tcl`: original card shipped with Delphes. For reference.

process in `process`: define you process here. Only the process-specific cmd needed here.

```
# Usage example: run locally
# ./run.sh [name] [process_mg5] [process_pythia] [detector] [seed] [events] [pileup]
./run.sh vbf vbf.mg5 vbf.pythia ATLAS_PileUp_10deg_antiKt06.tcl 1 1000 50
```

```
# Usage example: submit jobs
# modify the submit.job (how many job) and run_job.sh (what to do in one job)
condor_submit submit.job
```
