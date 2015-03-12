export hiptest_config=qunit.conf
export results=results.xml

setup() {
  npm install
}

run_tests() {
  npm test
}