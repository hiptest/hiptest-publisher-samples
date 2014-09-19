#!/bin/bash
set -e

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

gem install zest-publisher

cd ruby
header "Ruby"

logMessage "Installing"
bundle install

logMessage "Updating rspec tests"
zest-publisher -c rspec.conf --tests-only
logMessage "Running rspec tests"
bundle exec rspec

logMessage "Updating minitest tests"
zest-publisher -c minitest.conf --tests-only
logMessage "Running minitest tests"
bundle exec ruby test/project_test.rb
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

cd java-junit
header "Java / JUnit"

logMessage "Updating tests"
zest-publisher -c junit.config --tests-only
logMessage "Packaging and running tests"
mvn package

cd -

cd java-testng
header "Java / TestNG"

logMessage "Updating tests"
zest-publisher -c testng.config --tests-only
logMessage "Packaging and running tests"
mvn package

cd -


cd robotframework
header "Robot framework"

logMessage "Installing"
sudo pip install robotframework

logMessage "Updating tests"
zest-publisher -c robotframework.conf --split-scenarios --test-only

logMessage "Running tests"
pybot -P src:tests tests/test_*

cd -