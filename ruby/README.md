Ruby
====

First, you must use ``bundle`` to get the gems to run the tests:

    bundle install

The SUT implementation can be seen in [``src/coffee_machine.rb``](https://github.com/Smartesting/zest-publisher-samples/blob/master/ruby/src/coffee_machine.rb)

Rspec
-----

To run the rspec tests:

    bundle exec rspec

To update the tests:

    zest-publisher -c zest.config --tests-only

The tests are generated in [``spec/project_spec.rb``](https://github.com/Smartesting/zest-publisher-samples/blob/master/ruby/spec/project_spec.rb)
