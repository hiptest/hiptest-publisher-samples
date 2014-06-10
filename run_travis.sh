#!/bin/bash
set -ev

header() {
  local msg=$1
  echo "==============================================================================="
  echo $*
  pwd
  echo "==============================================================================="
}

logMessage() {
  echo "-------------------------------------------------------------------------------"
  echo "$*"
  echo "-------------------------------------------------------------------------------"
}

cd ruby
header "Ruby"

logMessage "Installing"
bundle install
logMessage "Updating tests"
zest-publisher -c rspec.conf --tests-only
logMessage "Running tests"
bundle exec rspec
cd -

cd python
header "Python"

logMessage "Installing"
python bootstrap.py
bin/buildout
logMessage "Updating tests"
zest-publisher -c unittest.conf --tests-only
logMessage "Running tests"
bin/test

cd -

cd java
header "Java"

logMessage "Updating tests"
zest-publisher -c junit.conf --tests-only
logMessage "Packaging and running tests"
mvn package

cd -