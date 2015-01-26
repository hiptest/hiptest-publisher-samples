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

# gem install hiptest-publisher

cd ruby
header "Ruby"

logMessage "Installing"
bundle install

logMessage "Updating rspec tests"
hiptest-publisher -c rspec.conf --tests-only -v
logMessage "Running rspec tests"
bundle exec rspec -r rspec-extra-formatters -f TapFormatter > results.tap
curl -X POST -F file=@results.tap https://hiptest.net/import_test_results/364282478521524761932745460494209729632304114181996206769/tap

logMessage "Updating minitest tests"
hiptest-publisher -c minitest.conf --tests-only
logMessage "Running minitest tests"
bundle exec ruby test/project_test.rb
cd -

cd python
header "Python"

logMessage "Installing"
python bootstrap.py
bin/buildout
logMessage "Updating tests"
hiptest-publisher -c unittest.conf --tests-only
logMessage "Running tests"
bin/test

cd -

cd java-junit
header "Java / JUnit"

logMessage "Updating tests"
hiptest-publisher -c junit.config --tests-only
logMessage "Packaging and running tests"
mvn package

cd -

cd java-testng
header "Java / TestNG"

logMessage "Updating tests"
hiptest-publisher -c testng.config --tests-only
logMessage "Packaging and running tests"
mvn package

cd -


cd robotframework
header "Robot framework"

logMessage "Installing"
sudo pip install robotframework

logMessage "Updating tests"
hiptest-publisher -c robotframework.conf --split-scenarios --test-only

logMessage "Running tests"
pybot -P src:tests tests/test_*

cd -

cd javascript
header "Javascript"

cd "selenium-ide"
logMessage "Updating Selenium IDE scripts"
hiptest-publisher -c seleniumide.conf
hiptest-publisher -c seleniumide.conf --split-scenarios
cd ..

cd ..