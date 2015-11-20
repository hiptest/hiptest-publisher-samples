export hiptest_config=nunit.conf
export results=TestResult.xml

setup() {
  nuget install SpecFlow -Version 1.9.0
  nuget install NUnit -Version 2.6.4
  nuget install NUnit.Runners -Version 2.6.4
}

run_tests() {
  mono SpecFlow.1.9.0/tools/specflow.exe generateall specflow_samples.csproj
  xbuild specflow_samples.csproj /t:compile
  nunit-console hiptest.publisher.samples.dll
}