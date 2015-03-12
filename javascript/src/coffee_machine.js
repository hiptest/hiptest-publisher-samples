function CoffeeMachine () {
  instance = new Object();
  instance.attributes = {
    _tank: 60,
    _beans: 40,
    _grounds: 0,
    _started: false,
    _coffeeServed: false,
    _message: '',
    _lang: 'en'
  }

  instance.i18n = {
    en: {
      tank: 'Fill tank',
      beans: 'Fill beans',
      grounds: 'Empty grounds',
      ready: 'Ready'
    },

    fr: {
      tank: 'Remplir reservoir',
      beans: 'Ajouter grains',
      grounds: 'Vider marc',
      ready: 'Pret'
    }
  }

  instance.listeners = {}

  instance.set = function (name, value) {
    instance.attributes['_' + name] = value;
    instance.triggerListeners(name);
  }

  instance.get = function (name) {
    return instance.attributes['_' + name];
  }

  instance.addListener = function (name, f) {
    if (instance.listeners[name] === undefined) {
      instance.listeners[name] = [];
    }
    instance.listeners[name].push(f)
  }

  instance.triggerListeners = function (name) {
    var listeners = instance.listeners[name] || [],
      value = instance.get(name);

    listeners.forEach(function (listener) {
      listener.call(null, value);
    });
  }

  var updateMessage = function () {
    var messages = instance.i18n[instance.get('lang')];

    if (!instance.get('started')) {
      instance.set('message', '');
      return;
    }

    if (instance.get('tank') <= 10) {
      instance.set('message', messages.tank);
      return;
    }

    if (instance.get('beans') < 3) {
      instance.set('message', messages.beans);
      return;
    }

    if (instance.get('grounds') >= 30) {
      instance.set('message', messages.grounds);
      return;
    }

    instance.set('message', messages.ready);
  }

  instance.addListener('started', updateMessage);
  instance.addListener('tank', updateMessage);
  instance.addListener('beans', updateMessage);
  instance.addListener('grounds', updateMessage);

  instance.start = function (lang) {
    instance.set('lang', lang || 'en');
    instance.set('started', true);
    instance.set('coffeeServed', false);
  }

  instance.stop = function () {
    instance.set('started', false);
  }

  instance.takeCoffee = function () {
    if (! instance.get('started')) {
      return;
    }

    if (instance.get('tank') === 0 || instance.get('beans') === 0) {
      instance.set('coffeeServed', false);
      return;
    }

    instance.set('coffeeServed', true);
    instance.set('tank', instance.get('tank') - 1);
    instance.set('beans', instance.get('beans') - 1);
    instance.set('grounds', instance.get('grounds') + 1);
  }

  instance.fillTank = function () {
    instance.set('tank', 60);
  }

  instance.fillBeans = function () {
    instance.set('beans', 40);
  }

  instance.emptyGrounds = function () {
    instance.set('grounds', 0);
  }

  return instance;
}