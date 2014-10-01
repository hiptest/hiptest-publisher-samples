Selenium IDE
============

You need Selenium IDE installed on Firefox to run the tests. Open the file ``coffee_machine.html`` in the parent folder with Firefox and start Selenium IDE (tools > Selenium IDE).

In Selenium IDE, open a test suite (File > Open Test Suite ...) and select the file ``project.html``. Click then on "Play entire tests suite" button to run the tests.

To update the test, run the following commands:

    zest-publisher -c seleniumide.conf
    zest-publisher -c seleniumide.conf --split-scenarios

Note that we usually run only one command. This time, there is one command to generate the test suite and one to generate the tests.

