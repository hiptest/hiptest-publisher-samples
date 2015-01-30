export hiptest_config=rspec.conf
export results=results_rspec.tap

setup() {
  bundle install
}

run_tests() {
  bundle exec rspec -r rspec-extra-formatters -f TapFormatter > results_rspec.tap
}