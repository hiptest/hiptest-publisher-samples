Ruby
====

First, you must use ``bundle`` to get the gems to run the tests:

    bundle install

The SUT implementation can be seen in [``src/coffee_machine.rb``](https://github.com/hiptest/hiptest-publisher-samples/blob/master/ruby/src/coffee_machine.rb)

Rspec
-----

To run the rspec tests:

    bundle exec rspec

To update the tests:

    hiptest-publisher -c rspec.conf --only=tests

The tests are generated in [``spec/project_spec.rb``](https://github.com/hiptest/hiptest-publisher-samples/blob/master/ruby/spec/project_spec.rb)

Minitest
--------

To run the minitest tests:

    bundle exec ruby test/project_test.rb

To update the tests:

    hiptest-publisher -c minitest.conf --only=tests

The tests are generated in [``test/project_spec.rb``](https://github.com/hiptest/hiptest-publisher-samples/blob/master/ruby/test/project_spec.rb)

Cucumber
--------

To run the cucumber features:

    bundle exec cucumber cukes

To update the feature files:

    hiptest-publisher -c cucumber.conf --only=features

The tests are generated in multiple feature files in [``cukes``](https://github.com/hiptest/hiptest-publisher-samples/blob/master/ruby/cukes) directory.

Cucumber export generates one ``.feature`` file per scenario and a ``step_definitions.rb`` file. To export action words method definitions, you have to do a ruby export of the action words only:

    hiptest-publisher -c cucumber_actionwords.conf --only=actionwords
