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

seekAndRunTestsForDir() {
  local dir=$1;

  if [ "$dir" != "bin/" ]; then
    cd $dir
    header $dir

    for src in *_htp.sh; do
      if [ -f $src ]; then
        updateAndRunTests $src;
      fi
    done

    cd ..
  fi
}

updateAndRunTests() {
  local src=$1;
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
}

installHiptestPublisher() {
  gem install hiptest-publisher
}

show_help() {
  echo "bin/run_travis"
  echo " -l Use specific language"
  echo " -f Use specific htp file (only use framework name (eg: minitest, not minitest_htp.sh)"
  echo " -h Show this message"
}


OPTIND=1
export language=""
export htp_file=""

while getopts "h?l:f:" opt; do
  case "$opt" in
  l)  language="$OPTARG"
      ;;
  f)  htp_file="$OPTARG"
      ;;
  h|\?)
      show_help
      exit 0
      ;;
  esac
done

installHiptestPublisher

if [ "$language" != "" ]; then
  if [ "$htp_file" != "" ]; then
    cd $language
    updateAndRunTests "${htp_file}_htp.sh"
    cd ..
  else
    seekAndRunTestsForDir $language
  fi
else
  for dir in */; do
    seekAndRunTestsForDir $dir
  done
fi
