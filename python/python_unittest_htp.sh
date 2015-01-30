export hiptest_config=unittest.conf
export results=TestCoffeeMachineHiptestPublisherSample.tap

setup() {
  python bootstrap.py
  bin/buildout
}

run_tests() {
  bin/test --with-tap
}