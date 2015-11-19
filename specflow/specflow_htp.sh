export hiptest_config=nunit.conf
export results=TestResult.xml

setup() {
  nuget install SpecFlow
}

run_tests() {
  mono SpecFlow_v1.9.0_bin/tools/specflow.exe generateall specflow_samples.csproj
  mcs /target:library /out:hiptest.publisher.samples.dll ../csharp/class/CoffeeMachine.cs features/Actionwords.cs features/Error_messages.feature.cs features/Scenarios.feature.cs -reference:nunit.framework.dll -r:SpecFlow_v1.9.0_bin/tools/TechTalk.SpecFlow.dll
  nunit-console hiptest.publisher.samples.dll
}