#!/bin/sh

cd ruby
zest-publisher -c rspec.conf --tests-only
bundle install
bundle exec rspec

cd ../python
zest-publisher -c unittest.conf --tests-only
python bootstrap.py
bin/buildout
bin/test

cd ../java
zest-publisher -c junit.conf --tests-only
mvn package
