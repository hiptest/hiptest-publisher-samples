export hiptest_config=qunit.conf
export results=_build/test-reports/TEST-index.xml

setup() {
  npm install
}

run_tests() {
  grunt qunit_junit qunit --verbose
}