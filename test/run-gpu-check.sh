#!/bin/bash
CURDIR=`pwd`
for f in $( ls profileData ); do
  cat profileData/$f/divergent | sort | uniq -u > profileData/$f/divergent.uniq
  mv profileData/$f/divergent.uniq profileData/$f/divergent
  cat profileData/$f/uncoalesced | sort | uniq -u > profileData/$f/uncoalesced.uniq
  mv profileData/$f/uncoalesced.uniq profileData/$f/uncoalesced
done
echo "Benchmark, Div TP, Div FP, Div FN, Col TP, Col FP, Col FN, Time"
for f in $( ls profileData ); do
  echo -n "$f"
  DD="${CURDIR}/gcheckData/$f"
  mkdir -p $DD
  cd rodinia_3.1/cuda/$f
  make clean > /dev/null 2>/dev/null
  make NVCC=${CURDIR}/gpu-check 2> "$DD/tmp" > "$DD/tmp"
  awk '/Divergence Issues:/{flag=1;next}/GPU-Check ran successfully/{flag=0}flag' "$DD/tmp" > "$DD/divergent"
  awk '/Memory Coalescing Issues:/{flag=1;next}/Divergence Issues:/{flag=0}flag' "$DD/tmp" > "$DD/uncoalesced"
  awk '/Start Exec Time/{flag=1;next}/End Exec Time/{flag=0}flag' "$DD/tmp" > "$DD/runtime"
  cd $CURDIR
  #Drop preceding ./
  sed -i 's/.*\///g' "$DD/divergent"
  sed -i 's/.*\///g' "$DD/uncoalesced"
  #Sort and Unique results
  cat "$DD/divergent" | sort | uniq > "$DD/divergent.uniq"
  mv "$DD/divergent.uniq" "$DD/divergent"
  cat "$DD/uncoalesced" | sort | uniq > "$DD/uncoalesced.uniq"
  mv "$DD/uncoalesced.uniq" "$DD/uncoalesced"

  #Print results
  echo -n ", "
  comm -1 -2 "${CURDIR}/profileData/$f/divergent" "$DD/divergent" | wc -l | tr -d '\n'
  echo -n ", "
  diff "${CURDIR}/profileData/$f/divergent" "$DD/divergent" | grep "^>" | wc -l | tr -d '\n'
  echo -n ", "
  diff "${CURDIR}/profileData/$f/divergent" "$DD/divergent" | grep "^<" | wc -l | tr -d '\n'
  echo -n ", "
  comm -1 -2 "${CURDIR}/profileData/$f/uncoalesced" "$DD/uncoalesced" | wc -l | tr -d '\n'
  echo -n ", "
  diff "${CURDIR}/profileData/$f/uncoalesced" "$DD/uncoalesced" | grep "^>" | wc -l | tr -d '\n'
  echo -n ", "
  diff "${CURDIR}/profileData/$f/uncoalesced" "$DD/uncoalesced" | grep "^<" | wc -l | tr -d '\n'
  echo -n ", "
  head -n 1 "${DD}/runtime"
done
