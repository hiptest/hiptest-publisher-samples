#!/bin/bash
set +e

header() {
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

for dir in */; do
  cd $dir
  header $dir

  for src in *_htp.sh; do
    if [ -f $src ]; then
      setup() {
        :
      };

      source $src

      logMessage "Setting up project"
      setup

      logMessage "Updating tests"
      hiptest-publisher -c $hiptest_config --tests-only

      logMessage "Running tests"
      run_tests

      logMessage "Pushing results to Hiptest"
      hiptest-publisher -p $results -c $hiptest_config
    fi
  done

  cd ..
done
