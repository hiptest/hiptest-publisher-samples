Python
======

The project uses [buildout](http://www.buildout.org/en/latest/), to set it up:

    python bootstrap.py
    bin/buildout

The SUT immplementation can be seen in [``src/coffee_machine.py``](https://github.com/hiptest/hiptest-publisher-samples/blob/master/python/src/coffee_machine.py)


UnitTest:
---------

To run the unittest tests:

    bin/test

To update the tests:

    hiptest-publisher -c unittest.conf --only=tests

The tests are generated in [``src/tests/test_project.py``](https://github.com/hiptest/hiptest-publisher-samples/blob/master/python/src/tests/test_project.py)

