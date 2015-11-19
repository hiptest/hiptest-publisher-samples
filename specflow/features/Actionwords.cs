namespace Hiptest.Publisher.Samples {
    using NUnit.Framework;

    public class Actionwords {
        CoffeeMachine Sut = new CoffeeMachine();

        public void StartTheCoffeeMachine(string lang = "en") {
            Sut.Start(lang);
        }

        public void ShutdownCoffeeMachine() {
            Sut.Stop();
        }

        public void AssertDisplayedMessage(string message = "") {
            Assert.AreEqual(message, Sut.Message);
        }

        public void AssertCoffeeServed() {
            Assert.IsTrue(Sut.CoffeeServed);
        }

        public void AssertNoCoffeeIsServed() {
            Assert.IsFalse(Sut.CoffeeServed);
        }

        public void TakeACoffee() {
            Sut.TakeCoffee();
        }

        public void EmptyCoffeeGrounds() {
            Sut.EmptyGrounds();
        }

        public void FillBeans() {
            Sut.FillBeans();
        }

        public void FillWaterTank() {
            Sut.FillTank();
        }

        public void TakeCoffees(int coffeeNumber) {
            while ((coffeeNumber > 0)) {
                this.TakeACoffee();
                coffeeNumber = coffeeNumber - 1;
            }
        }
    }
}