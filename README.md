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


### Javascript

|  | qUnit | Jasmine | Mocha |
|:-:|:-:|:-:|:-:|
| Repository | [hps-javascript-qunit](https://github.com/hiptest/hps-javascript-qunit) | [hps-javascript-jasmine](https://github.com/hiptest/hps-javascript-jasmine) | [hps-javascript-mocha](https://github.com/hiptest/hps-javascript-mocha) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-javascript-qunit.svg?branch=master)](https://travis-ci.org/hiptest/hps-javascript-qunit) | [![Build Status](https://travis-ci.org/hiptest/hps-javascript-jasmine.svg?branch=master)](https://travis-ci.org/hiptest/hps-javascript-jasmine) | [![Build Status](https://travis-ci.org/hiptest/hps-javascript-mocha.svg?branch=master)](https://travis-ci.org/hiptest/hps-javascript-mocha) |


### Java

|  | JUnit | TestNG | Cucumber/Java |
|:-:|:-:|:-:|:-:|
| Repository | [hps-java-junit](https://github.com/hiptest/hps-java-junit) | [hps-java-testng](https://github.com/hiptest/hps-java-testng) | [hps-cucumber-java](https://github.com/hiptest/hps-cucumber-java) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-java-junit.svg?branch=master)](https://travis-ci.org/hiptest/hps-java-junit) | [![Build Status](https://travis-ci.org/hiptest/hps-java-testng.svg?branch=master)](https://travis-ci.org/hiptest/hps-java-testng) | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-java.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-java) |

### Python

|  | UnitTest | Behave |
|:-:|:-:|:-:|
| Repository | [hps-python-unittest](https://github.com/hiptest/hps-python-unittest) | [hps-behave](https://github.com/hiptest/hps-behave) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-python-unittest.svg?branch=master)](https://travis-ci.org/hiptest/hps-python-unittest) | [![Build Status](https://travis-ci.org/hiptest/hps-behave.svg?branch=master)](https://travis-ci.org/hiptest/hps-behave) |


### PHP

|  | PHPUnit | Behat |
|:-:|:-:|:-:|
| Repository | [hps-php-phpunit](https://github.com/hiptest/hps-php-phpunit) | [hps-behat](https://github.com/hiptest/hps-behat) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-php-phpunit.svg?branch=master)](https://travis-ci.org/hiptest/hps-php-phpunit) | [![Build Status](https://travis-ci.org/hiptest/hps-behat.svg?branch=master)](https://travis-ci.org/hiptest/hps-behat) |


### C# 

|  | NUnit | Specflow |
|:-:|:-:|:-:|
| Repository | [hps-csharp-nunit](https://github.com/hiptest/hps-csharp-nunit) | [hps-specflow](https://github.com/hiptest/hps-specflow) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-csharp-nunit.svg?branch=master)](https://travis-ci.org/hiptest/hps-csharp-nunit) | [![Build Status](https://travis-ci.org/hiptest/hps-specflow.svg?branch=master)](https://travis-ci.org/hiptest/hps-specflow) |


### Robot framework

|  | Robot framework |
|:-:|:-:|
| Repository | [hps-robotframework](https://github.com/hiptest/hps-robotframework) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-robotframework.svg?branch=master)](https://travis-ci.org/hiptest/hps-robotframework) |


### All Gherkin-based

|  | Cucumber/Ruby | Cucumber/Java | Specflow | Behave | Behat |
|:-:|:-:|:-:|:-:|:-:|:-:|
| Repository | [hps-cucumber-ruby](https://github.com/hiptest/hps-cucumber-ruby) | [hps-cucumber-java](https://github.com/hiptest/hps-cucumber-java) | [hps-specflow](https://github.com/hiptest/hps-specflow) | [hps-behave](https://github.com/hiptest/hps-behave) | [hps-behat](https://github.com/hiptest/hps-behat) |
| Build status | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-ruby.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-ruby) | [![Build Status](https://travis-ci.org/hiptest/hps-cucumber-java.svg?branch=master)](https://travis-ci.org/hiptest/hps-cucumber-java) | [![Build Status](https://travis-ci.org/hiptest/hps-specflow.svg?branch=master)](https://travis-ci.org/hiptest/hps-specflow) | [![Build Status](https://travis-ci.org/hiptest/hps-behave.svg?branch=master)](https://travis-ci.org/hiptest/hps-behave) | [![Build Status](https://travis-ci.org/hiptest/hps-behat.svg?branch=master)](https://travis-ci.org/hiptest/hps-behat) |


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

