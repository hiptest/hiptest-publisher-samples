namespace Hiptest.Publisher.Samples {

    using System;
    using NUnit.Framework;

    [TestFixture]
    public class ProjectTest {

        public Actionwords Actionwords;

        [SetUp]
        protected void SetUp() {
          Actionwords = new Actionwords();
        }

        public void SimpleUse(string lang, string readyMessage) {
            Actionwords.AssertDisplayedMessage();
            Actionwords.StartTheCoffeeMachine(lang);
            Actionwords.AssertDisplayedMessage(readyMessage);
            Actionwords.TakeACoffee();
            Actionwords.AssertCoffeeServed();
            Actionwords.ShutdownCoffeeMachine();
            Actionwords.AssertDisplayedMessage();
        }

        public void SimpleUseEnglishUidbe213f3d8bd24c378ed23a494fd92e87() {
            SimpleUse("en", "Ready");
        }

        public void SimpleUseFrenchUid9809634535224858b55ce02196b18482() {
            SimpleUse("fr", "Pret");
        }



        public void FullGroundsDoesNotBlockCoffeeUid1d0d17c3355e4a6eb293ecaa533b21ef() {
            Actionwords.StartTheCoffeeMachine();
            Actionwords.TakeCoffees(29);
            Actionwords.AssertDisplayedMessage("Ready");
            Actionwords.TakeACoffee();
            Actionwords.AssertCoffeeServed();
            Actionwords.AssertDisplayedMessage("Empty grounds");
            Actionwords.FillWaterTank();
            Actionwords.FillBeans();
            Actionwords.TakeCoffees(20);
            Actionwords.AssertCoffeeServed();
            Actionwords.AssertDisplayedMessage("Empty grounds");
        }

        public void WaterRunsAwayUidae4016f69b4d4ad7aeba32f710a9b6ab() {
            Actionwords.StartTheCoffeeMachine();
            Actionwords.TakeCoffees(30);
            Actionwords.FillBeans();
            Actionwords.EmptyCoffeeGrounds();
            Actionwords.TakeCoffees(20);
            Actionwords.FillBeans();
            Actionwords.EmptyCoffeeGrounds();
            Actionwords.AssertDisplayedMessage("Fill tank");
            Actionwords.FillBeans();
            Actionwords.TakeACoffee();
            Actionwords.AssertCoffeeServed();
            Actionwords.TakeCoffees(9);
            Actionwords.TakeACoffee();
            Actionwords.AssertNoCoffeeIsServed();
            Actionwords.AssertDisplayedMessage("Fill tank");
            Actionwords.FillWaterTank();
            Actionwords.EmptyCoffeeGrounds();
            Actionwords.AssertDisplayedMessage("Ready");
        }

        public void BeansRunOutUidf92ba764a84d4779b8ab585148497b89() {
            Actionwords.StartTheCoffeeMachine();
            Actionwords.AssertDisplayedMessage("Ready");
            Actionwords.TakeCoffees(37);
            Actionwords.EmptyCoffeeGrounds();
            Actionwords.FillWaterTank();
            Actionwords.AssertDisplayedMessage("Ready");
            Actionwords.TakeACoffee();
            Actionwords.AssertCoffeeServed();
            Actionwords.AssertDisplayedMessage("Fill beans");
            Actionwords.TakeACoffee();
            Actionwords.TakeACoffee();
            Actionwords.AssertCoffeeServed();
            Actionwords.AssertDisplayedMessage("Fill beans");
            Actionwords.TakeACoffee();
            Actionwords.AssertNoCoffeeIsServed();
        }
    }
}