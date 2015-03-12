export hiptest_config=jasmine.conf
export results=_build/test-reports/jasmine/TEST-CoffeemachineHiptestpublishersample.xml

setup() {
  npm install
}

run_tests() {
  grunt jasmine
}