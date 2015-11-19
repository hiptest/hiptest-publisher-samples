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
            Actionwords.IStartTheCoffeeMachine(lang);
            Actionwords.ITakeACoffee();
            Actionwords.CoffeeShouldBeServed();
        }

        [Test]
        public void SimpleUseEnglishUidbe213f3d8bd24c378ed23a494fd92e87() {
            SimpleUse("en", "Ready");
        }

        [Test]
        public void SimpleUseFrenchUid9809634535224858b55ce02196b18482() {
            SimpleUse("fr", "Pret");
        }



        [Test]
        public void FullGroundsDoesNotBlockCoffeeUid1d0d17c3355e4a6eb293ecaa533b21ef() {
            Actionwords.TheCoffeeMachineIsStarted();
            Actionwords.ITakeCoffeeNumberCoffees(29);
            Actionwords.MessageMessageShouldBeDisplayed("Ready");
            Actionwords.ITakeACoffee();
            Actionwords.CoffeeShouldBeServed();
            Actionwords.MessageMessageShouldBeDisplayed("Empty grounds");
            Actionwords.IFillTheWaterTank();
            Actionwords.IFillTheBeansTank();
            Actionwords.ITakeCoffeeNumberCoffees(20);
            Actionwords.CoffeeShouldBeServed();
            Actionwords.MessageMessageShouldBeDisplayed("Empty grounds");
        }

        [Test]
        public void WaterRunsAwayUidae4016f69b4d4ad7aeba32f710a9b6ab() {
            Actionwords.TheCoffeeMachineIsStarted();
            Actionwords.FiftyCoffeesHaveBeenTakenWithoutFillingTheTank();
            Actionwords.MessageMessageShouldBeDisplayed("Fill tank");
            Actionwords.ITakeACoffee();
            Actionwords.CoffeeShouldBeServed();
            Actionwords.ITakeCoffeeNumberCoffees(10);
            Actionwords.CoffeeShouldNotBeServed();
            Actionwords.MessageMessageShouldBeDisplayed("Fill tank");
            Actionwords.IFillTheWaterTank();
            Actionwords.MessageMessageShouldBeDisplayed("Ready");
        }

        [Test]
        public void BeansRunOutUidf92ba764a84d4779b8ab585148497b89() {
            Actionwords.TheCoffeeMachineIsStarted();
            Actionwords.ThirtyEightCoffeesAreTakenWithoutFillingBeans();
            Actionwords.CoffeeShouldBeServed();
            Actionwords.MessageMessageShouldBeDisplayed("Fill beans");
            Actionwords.ITakeCoffeeNumberCoffees(2);
            Actionwords.CoffeeShouldBeServed();
            Actionwords.MessageMessageShouldBeDisplayed("Fill beans");
            Actionwords.ITakeACoffee();
            Actionwords.CoffeeShouldNotBeServed();
        }
        public void MessagesAreBasedOnLanguage(string lang, string readyMessage) {
            Actionwords.IStartTheCoffeeMachine(lang);
            Actionwords.MessageMessageShouldBeDisplayed(readyMessage);
        }

        [Test]
        public void MessagesAreBasedOnLanguageEnglishUida4f9103300244a8bba72bad87b11abca() {
            MessagesAreBasedOnLanguage("en", "Ready");
        }

        [Test]
        public void MessagesAreBasedOnLanguageFrenchUidb91d9effab85422498638f6e97f357d0() {
            MessagesAreBasedOnLanguage("fr", "Pret");
        }



        [Test]
        public void NoMessagesAreDisplayedWhenMachineIsShutDownUid35f4862793964a0b9090bad7ac1fa0f1() {
            Actionwords.TheCoffeeMachineIsStarted();
            Actionwords.IShutdownTheCoffeeMachine();
            Actionwords.MessageMessageShouldBeDisplayed();
        }
    }
}