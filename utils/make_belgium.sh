#!/bin/bash
#
# This script combines all individual Belgian OpenAir files into one Belgian
# OpenAir file.


OA2PM_ROOTDIR=~/Dropbox/MyProjects/oaconvert
AIRSPACE_DIR=${OA2PM_ROOTDIR}/openair
OUTPUTFILE=$AIRSPACE_DIR/brussels_fir_autogenerated.txt


AIRSPACES="${AIRSPACE_DIR}/belgium/*fir*.txt
           ${AIRSPACE_DIR}/belgium/*ctr*.txt
           ${AIRSPACE_DIR}/belgium/*tma*.txt
           ${AIRSPACE_DIR}/belgium/*cta*.txt
           ${AIRSPACE_DIR}/belgium/*vectoring*.txt
           ${AIRSPACE_DIR}/belgium/lfa*.txt
           ${AIRSPACE_DIR}/luxembourg/*tma*.txt"

mkdir -p ${OA2PM_ROOTDIR}/gpx


# Generate OpenAir file for all airspaces.
> $OUTPUTFILE
for file in $AIRSPACES
do
  echo -n "Adding $(basename $file) to total airspace file... "
  cat $file >> $OUTPUTFILE
  echo -ne "\n\n" >> $OUTPUTFILE
  echo "done."
done


# Generate a GPX file for each airspace.
for file in $AIRSPACES
do
  echo -n "Generating GPX for $(basename $file)... "
  GPXFILE=${file%.txt}.gpx
  ${OA2PM_ROOTDIR}/src/oaconvert -o ${OA2PM_ROOTDIR}/gpx/$(basename $GPXFILE) $file
  echo "done."
done


# Generate Polish and GPX file for the whole of Belgium.
${OA2PM_ROOTDIR}/src/oaconvert -o ${OA2PM_ROOTDIR}/cgpsmapper/brussels_fir_autogenerated.mp ${OA2PM_ROOTDIR}/openair/brussels_fir_autogenerated.txt
${OA2PM_ROOTDIR}/src/oaconvert -o ${OA2PM_ROOTDIR}/gpx/brussels_fir_autogenerated.gpx ${OA2PM_ROOTDIR}/openair/brussels_fir_autogenerated.txt
