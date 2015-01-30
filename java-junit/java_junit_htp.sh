export hiptest_config=junit.config
export results=target/surefire-reports/TEST-com.coffeemachine.ProjectTest.xml

run_tests() {
  mvn package;
}