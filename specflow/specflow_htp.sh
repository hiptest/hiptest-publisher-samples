export hiptest_config=nunit.conf
export results=TestResult.xml

setup() {
  nuget install SpecFlow
}

run_tests() {
  mono SpecFlow.1.9.0/tools/specflow.exe generateall specflow_samples.csproj
  mcs /target:library /out:hiptest.publisher.samples.dll ../csharp/class/CoffeeMachine.cs features/Actionwords.cs features/Error_messages.feature.cs features/Scenarios.feature.cs -reference:nunit.framework.dll -r:SpecFlow.1.9.0/tools/TechTalk.SpecFlow.dll
  nunit-console hiptest.publisher.samples.dll
}