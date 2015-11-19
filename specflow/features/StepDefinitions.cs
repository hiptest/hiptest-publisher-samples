namespace Hiptest.Publisher.Samples {

    [Binding]
    public class StepDefinitions {

        [Given(@"^Start the coffee machine \"(.*)\"$")]
        public void StartTheCoffeeMachine(null lang) {
            StartTheCoffeeMachine(null lang);
        }


        [Given(@"^Shutdown coffee machine$")]
        public void ShutdownCoffeeMachine() {
            ShutdownCoffeeMachine();
        }


        [Given(@"^Assert displayed message \"(.*)\"$")]
        public void AssertDisplayedMessage(string message) {
            AssertDisplayedMessage(string message);
        }


        [Given(@"^Assert coffee served$")]
        public void AssertCoffeeServed() {
            AssertCoffeeServed();
        }


        [Given(@"^Assert no coffee is served$")]
        public void AssertNoCoffeeIsServed() {
            AssertNoCoffeeIsServed();
        }


        [Given(@"^Take a coffee$")]
        public void TakeACoffee() {
            TakeACoffee();
        }


        [Given(@"^Empty coffee grounds$")]
        public void EmptyCoffeeGrounds() {
            EmptyCoffeeGrounds();
        }


        [Given(@"^Fill beans$")]
        public void FillBeans() {
            FillBeans();
        }


        [Given(@"^Fill water tank$")]
        public void FillWaterTank() {
            FillWaterTank();
        }


        [Given(@"^Take coffees \"(.*)\"$")]
        public void TakeCoffees(int coffeeNumber) {
            TakeCoffees(int coffeeNumber);
        }
    }
}