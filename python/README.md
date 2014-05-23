Python
======

The project uses [buildout](http://www.buildout.org/en/latest/), to set it up:

    python bootstrap.py
    bin/buildout


UnitTest:
---------

To run the unittest tests:

    bin/test

To update the tests:

    zest-publisher -c unittest.conf --tests-only

