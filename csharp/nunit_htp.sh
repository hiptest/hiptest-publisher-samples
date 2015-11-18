export hiptest_config=nunit.conf
export results=TestResult.xml

run_tests() {
  mcs /target:library /out:hiptest.publisher.samples.dll class/CoffeeMachine.cs tests/Actionwords.cs tests/ProjectTest.cs -reference:nunit.framework.dll
  nunit-console hiptest.publisher.samples.dll
}