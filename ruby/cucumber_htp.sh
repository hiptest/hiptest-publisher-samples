export hiptest_config=cucumber.conf
export results=results_cucumber.tap

setup() {
  bundle install
}

run_tests() {
  bundle exec cucumber cukes
  touch $result # no result file for cucumber for the moment...
}
