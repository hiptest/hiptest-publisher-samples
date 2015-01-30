export hiptest_config=testng.config
export results=target/surefire-reports/junitreports/TEST-com.testng.coffeemachine.ProjectTest.xml

run_tests() {
  mvn package;
}