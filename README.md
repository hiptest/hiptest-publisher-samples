Zest publisher: samples
=======================

In this repository you'll find tests generated from [Zest](https://www.zest-testing.com), using [Zest publisher](https://github.com/Smartesting/zest-publisher).

The goals are:

 * to show how tests are exported in the various laguages
 * to test frameworks
 * to check frameworks work as expected

System under test
------------------

The SUT is a (not that much) simple coffee machine. You start it, you ask for a coffee and you get it, sometimes. But most of times you have to add water or beans, empty the grounds. You have an automatic expresso machine at work or at home? So you know how it goes :-)

Languages
----------

### Python

The project uses [buildout](http://www.buildout.org/en/latest/), to set it up:

    cd python
    python bootstrap.py
    bin/buildout

Then run the tests:

    bin/test
