class CoffeeMachine
  attr_reader :coffee_served

  def initialize
    @started = false

    # Yes it's a magic machine :)
    fill_tank()
    fill_beans()
    empty_grounds()

    @coffee_served = false
  end

  def start
    @started = true
  end

  def stop
    @started = false
  end

  def message
    return '' unless @started

    return "Fill tank" if @tank_content <= 10
    return "Fill beans" if @beans_content < 3
    return "Empty grounds" if @grounds_content >= 30
    return "Ready"
  end

  def take_coffee
    if (@tank_content == 0 || @beans_content == 0)
      @coffee_served = false
    else
      @coffee_served = true
      @tank_content -= 1
      @beans_content -= 1
      @grounds_content += 1
    end
  end

  def fill_tank
    @tank_content = 60
  end

  def fill_beans
    @beans_content = 40
  end

  def empty_grounds
    @grounds_content = 0
  end
end