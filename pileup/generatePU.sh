#!/bin/bash
rm MinBias.root MinBias.pileup
WriteArea=`pwd`
DelphesPythia8 $DELPHES_PATH/cards/converter_card.tcl $WriteArea//generatePileUp.cmnd $WriteArea/MinBias.root
root2pileup $WriteArea/MinBias.pileup $WriteArea/MinBias.root
