#!/bin/bash
CURDIR=`pwd`
for f in $( ls profileData ); do
  echo "Running analysis on $f"
  DD=${CURDIR}/gcheckData/$f
  mkdir -p $DD
  cd rodinia_3.1/cuda/$f
  make clean > /dev/null 2>/dev/null
  make NVCC=${CURDIR}/gpu-check 2> $DD/tmp > $DD/tmp
  awk '/Divergence Issues:/{flag=1;next}/GPU-Check ran successfully/{flag=0}flag' $DD/tmp > $DD/divergent
  awk '/Memory Coalescing Issues:/{flag=1;next}/Divergence Issues:/{flag=0}flag' $DD/tmp > $DD/uncoalesced
  rm $DD/tmp
  cd $CURDIR
  echo "Cleaning Results"
  #Drop preceding ./
  sed -i 's/\.\///g' $DD/divergent
  sed -i 's/\.\///g' $DD/uncoalesced
done
