export hiptest_config=nunit.conf
export results=TestResult.xml

setup() {
  nuget install NUnit -Version 2.6.4
  nuget install NUnit.Runners -Version 2.6.4
}

run_tests() {
  xbuild nunit.csproj /t:test
}