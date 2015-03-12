export hiptest_config=jasmine.conf
export results=_build/test-reports/jasmine/TEST-CoffeemachineHiptestpublishersample.xml

setup() {
  npm install
}

run_tests() {
  npm test_jasmine
}