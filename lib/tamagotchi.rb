class Tamagotchi
  def initialize (name)
    @name = name
    @food = 10
    @sleep = 10
    @activity = 10
  end

  def food_level
    @food
  end

  def name
    @name
  end

  def sleep_level
    @sleep
  end

  def activity_level
    @activity
  end

end
