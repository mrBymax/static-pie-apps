#!/bin/bash

git clone https://github.com/apache/cassandra.git cassandra
pushd cassandra > /dev/null 2>&1
git checkout 3.11.10
ant
popd > /dev/null 2>&1

ln -fn cassandra/build/apache-cassandra-3.11.10/bin/cassandra .
ln -fn cassandra/build/apache-cassandra-3.11.10/bin/cqlsh .
