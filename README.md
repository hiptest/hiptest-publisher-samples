Hiptest publisher: samples
=======================

This repository is a meta-repository to link all hps-* repositories, which show tests generated from [Hiptest](https://hiptest.net), using [Hiptest publisher](https://github.com/hiptest/hiptest-publisher).


System under test
------------------

The SUT is a (not that much) simple coffee machine. You start it, you ask for a coffee and you get it, sometimes. But most of times you have to add water or beans, empty the grounds. You have an automatic expresso machine at work or at home? So you know how it goes :-)

Languages
----------

For each supported language and frameworks supported by hiptest-publisher, we have a dedicated Github repository which shows the tests generated. All repositories are connected to Travis to show how hiptest integrates with a CI tool.
If Travis does not show any status, that means that its an export we're working on and that should be available in the next release of hiptest-publisher.

### Ruby

| | Rspec  | Minitest  | Cucumber  |
|:-:|:-:|:-:|:-:|
| Repository   | [hps-ruby-rspec](https://github.com/hiptest/hps-ruby-rspec) | [hps-ruby-minitest](https://github.com/hiptest/hps-ruby-minitest) | [hps-cucumber-ruby](https://github.com/hiptest/hps-cucumber-ruby) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-ruby-rspec.svg?branch=master)](https://travis-ci.org/hiptest/hps-ruby-rspec) | [![Build Status](https://travis-ci.org/hiptest/hps-ruby-minitest.svg?branch=master)](https://travis-ci.org/hiptest/hps-ruby-minitest) | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-ruby.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-ruby) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/1354)](https://hiptest.net#/projects/1512/testRuns/1354) | [![Hiptest Status](https://hiptest.net/badges/test_run/1356)](https://hiptest.net#/projects/1512/testRuns/1356) | [![Hiptest Status](https://hiptest.net/badges/test_run/3507)](https://hiptest.net#/projects/1512/testRuns/3507) |


### Javascript

|  | qUnit | Jasmine | Mocha | Cucumber-js |
|:-:|:-:|:-:|:-:|:-:|
| Repository | [hps-javascript-qunit](https://github.com/hiptest/hps-javascript-qunit) | [hps-javascript-jasmine](https://github.com/hiptest/hps-javascript-jasmine) | [hps-javascript-mocha](https://github.com/hiptest/hps-javascript-mocha) | [hps-cucumber-javascript](https://github.com/hiptest/hps-cucumber-javascript) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-javascript-qunit.svg?branch=master)](https://travis-ci.org/hiptest/hps-javascript-qunit) | [![Build Status](https://travis-ci.org/hiptest/hps-javascript-jasmine.svg?branch=master)](https://travis-ci.org/hiptest/hps-javascript-jasmine) | [![Build Status](https://travis-ci.org/hiptest/hps-javascript-mocha.svg?branch=master)](https://travis-ci.org/hiptest/hps-javascript-mocha) | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-javascript.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-javascript) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/1966)](https://hiptest.net#/projects/1512/testRuns/1966) | [![Hiptest Status](https://hiptest.net/badges/test_run/1979)](https://hiptest.net#/projects/1512/testRuns/1979) | [![Hiptest Status](https://hiptest.net/badges/test_run/11085)](https://hiptest.net#/projects/1512/testRuns/11085) | [![Hiptest Status](https://hiptest.net/badges/test_run/16534)](https://hiptest.net#/projects/1512/testRuns/16534) |

### Java

|  | JUnit | TestNG | Cucumber/Java |
|:-:|:-:|:-:|:-:|
| Repository | [hps-java-junit](https://github.com/hiptest/hps-java-junit) | [hps-java-testng](https://github.com/hiptest/hps-java-testng) | [hps-cucumber-java](https://github.com/hiptest/hps-cucumber-java) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-java-junit.svg?branch=master)](https://travis-ci.org/hiptest/hps-java-junit) | [![Build Status](https://travis-ci.org/hiptest/hps-java-testng.svg?branch=master)](https://travis-ci.org/hiptest/hps-java-testng) | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-java.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-java) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/1358)](https://hiptest.net#/projects/1512/testRuns/1358) | [![Hiptest Status](https://hiptest.net/badges/test_run/1359)](https://hiptest.net#/projects/1512/testRuns/1359) | [![Hiptest Status](https://hiptest.net/badges/test_run/10248)](https://hiptest.net#/projects/1512/testRuns/10248) |

### Python

|  | UnitTest | Behave |
|:-:|:-:|:-:|
| Repository | [hps-python-unittest](https://github.com/hiptest/hps-python-unittest) | [hps-behave](https://github.com/hiptest/hps-behave) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-python-unittest.svg?branch=master)](https://travis-ci.org/hiptest/hps-python-unittest) | [![Build Status](https://travis-ci.org/hiptest/hps-behave.svg?branch=master)](https://travis-ci.org/hiptest/hps-behave) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/1357)](https://hiptest.net#/projects/1512/testRuns/1357) | [![Hiptest Status](https://hiptest.net/badges/test_run/16134)](https://hiptest.net#/projects/1512/testRuns/16134) | 

### PHP

|  | PHPUnit | Behat |
|:-:|:-:|:-:|
| Repository | [hps-php-phpunit](https://github.com/hiptest/hps-php-phpunit) | [hps-behat](https://github.com/hiptest/hps-behat) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-php-phpunit.svg?branch=master)](https://travis-ci.org/hiptest/hps-php-phpunit) | [![Build Status](https://travis-ci.org/hiptest/hps-behat.svg?branch=master)](https://travis-ci.org/hiptest/hps-behat) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/11084)](https://hiptest.net#/projects/1512/testRuns/11084) | [![Hiptest Status](https://hiptest.net/badges/test_run/16135)](https://hiptest.net#/projects/1512/testRuns/16135) | 

### C# 

|  | NUnit | Specflow |
|:-:|:-:|:-:|
| Repository | [hps-csharp-nunit](https://github.com/hiptest/hps-csharp-nunit) | [hps-specflow](https://github.com/hiptest/hps-specflow) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-csharp-nunit.svg?branch=master)](https://travis-ci.org/hiptest/hps-csharp-nunit) | [![Build Status](https://travis-ci.org/hiptest/hps-specflow.svg?branch=master)](https://travis-ci.org/hiptest/hps-specflow) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/9861)](https://hiptest.net#/projects/1512/testRuns/9861) | [![Hiptest Status](https://hiptest.net/badges/test_run/9941)](https://hiptest.net#/projects/1512/testRuns/9941) |

### Robot framework

|  | Robot framework |
|:-:|:-:|
| Repository | [hps-robotframework](https://github.com/hiptest/hps-robotframework) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-robotframework.svg?branch=master)](https://travis-ci.org/hiptest/hps-robotframework) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/1360)](https://hiptest.net#/projects/1512/testRuns/1360) | 

### All Gherkin-based

|  | Cucumber/Ruby | Cucumber/Java | Specflow | Behave | Behat | Cucumber-js |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| Repository | [hps-cucumber-ruby](https://github.com/hiptest/hps-cucumber-ruby) | [hps-cucumber-java](https://github.com/hiptest/hps-cucumber-java) | [hps-specflow](https://github.com/hiptest/hps-specflow) | [hps-behave](https://github.com/hiptest/hps-behave) | [hps-behat](https://github.com/hiptest/hps-behat) | [hps-cucumber-javascript](https://github.com/hiptest/hps-cucumber-javascript) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-ruby.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-ruby) | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-java.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-java) | [![Build Status](https://travis-ci.org/hiptest/hps-specflow.svg?branch=master)](https://travis-ci.org/hiptest/hps-specflow) | [![Build Status](https://travis-ci.org/hiptest/hps-behave.svg?branch=master)](https://travis-ci.org/hiptest/hps-behave) | [![Build Status](https://travis-ci.org/hiptest/hps-behat.svg?branch=master)](https://travis-ci.org/hiptest/hps-behat) | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-javascript.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-javascript) |
| Hiptest | [![Hiptest Status](https://hiptest.net/badges/test_run/3507)](https://hiptest.net#/projects/1512/testRuns/3507) | [![Hiptest Status](https://hiptest.net/badges/test_run/10248)](https://hiptest.net#/projects/1512/testRuns/10248) | [![Hiptest Status](https://hiptest.net/badges/test_run/9941)](https://hiptest.net#/projects/1512/testRuns/9941) | [![Hiptest Status](https://hiptest.net/badges/test_run/16134)](https://hiptest.net#/projects/1512/testRuns/16134) | [![Hiptest Status](https://hiptest.net/badges/test_run/16135)](https://hiptest.net#/projects/1512/testRuns/16135) | [![Hiptest Status](https://hiptest.net/badges/test_run/16534)](https://hiptest.net#/projects/1512/testRuns/16534) |

Releasing a new version of hiptest-publisher
--------------------------------------------

When a new release of hiptest-publisher is done, it is important to run the tests again on the ``hps-*`` repositories. To do so:
 - check that you have read/write access to all ``hps-*`` repositories
 - from this repository, run:

```shell
bin/clone-all
bin/update-hps-version 0.10.0 # Or whatever version has just been released
```

That will make a new commit in each repositories and trigger the Travis build.

When a new language is added, also ensure that the file ``hps/repos-list`` contains the name of the repository showing the samples.

