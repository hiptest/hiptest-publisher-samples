export hiptest_config=robotframework.conf
export results=output.xml

setup() {
  sudo pip install robotframework
}

run_tests() {
  pybot -P src:tests tests/test_*
}