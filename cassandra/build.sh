#!/bin/bash

APPNAME=cassandra
VERSION=4.0.6
DIRNAME=apache-${APPNAME}-${VERSION}
ARCHIVE=${DIRNAME}-bin.tar.gz
URL=https://dlcdn.apache.org/${APPNAME}/${VERSION}/${DIRNAME}-bin.tar.gz

# Clean up
rm -rf ${ARCHIVE}
rm -rf ${DIRNAME}

echo -n "Downloading ${APPNAME} sources ... "
wget -q ${URL}
if test $? -ne 0; then
  echo ""
  echo "Unable to download ${APPNAME} from ${URL}"
  exit 1
fi
echo "DONE"

echo ""
echo -n "Unpacking cassandra ... "
tar -xzf ${ARCHIVE}
if test $? -ne 0; then
  echo ""
  echo "Unable to extract ${APPNAME}"
  exit 1
fi
echo "DONE"

echo ""
rm ${ARCHIVE}

cd ${DIRNAME}
bin/cqlsh
