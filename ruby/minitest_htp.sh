export hiptest_config=minitest.conf
export results=results_minitest.tap

setup() {
  bundle install
}

run_tests() {
  bundle exec ruby -Ilib test/project_test.rb - --tapy | tapout tap > results_minitest.tap
}