export hiptest_config=cucumber.conf
export results=results_cucumber.tap

setup() {
  bundle install
}

run_tests() {
  bundle exec cucumber cukes --format Hiptest::TapFormatter --out $results --format pretty
}
