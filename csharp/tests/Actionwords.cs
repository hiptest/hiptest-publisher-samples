namespace Hiptest.Publisher.Samples {
    using NUnit.Framework;

    public class Actionwords {
        CoffeeMachine Sut = new CoffeeMachine();

        public void IStartTheCoffeeMachine(string lang = "en") {
            Sut.Start(lang);
        }

        public void IShutdownTheCoffeeMachine() {
            Sut.Stop();
        }

        public void MessageMessageShouldBeDisplayed(string message = "") {
            Assert.AreEqual(message, Sut.Message);
        }

        public void CoffeeShouldBeServed() {
            Assert.IsTrue(Sut.CoffeeServed);
        }

        public void CoffeeShouldNotBeServed() {
            Assert.IsFalse(Sut.CoffeeServed);
        }

        public void ITakeACoffee() {
            Sut.TakeCoffee();
        }

        public void IEmptyTheCoffeeGrounds() {
            Sut.EmptyGrounds();
        }

        public void IFillTheBeansTank() {
            Sut.FillBeans();
        }

        public void IFillTheWaterTank() {
            Sut.FillTank();
        }

        public void ITakeCoffeeNumberCoffees(int coffeeNumber) {
            while ((coffeeNumber > 0)) {
                ITakeACoffee();
                coffeeNumber = coffeeNumber - 1;
            }
        }

        public void TheCoffeeMachineIsStarted() {
            IStartTheCoffeeMachine();
        }

        public void FiftyCoffeesHaveBeenTakenWithoutFillingTheTank() {
            ITakeCoffeeNumberCoffees(30);
            IFillTheBeansTank();
            IEmptyTheCoffeeGrounds();
            ITakeCoffeeNumberCoffees(20);
            IFillTheBeansTank();
            IEmptyTheCoffeeGrounds();
        }

        public void ThirtyEightCoffeesAreTakenWithoutFillingBeans() {
            ITakeCoffeeNumberCoffees(37);
            IEmptyTheCoffeeGrounds();
            IFillTheWaterTank();
            ITakeACoffee();
        }
    }
}