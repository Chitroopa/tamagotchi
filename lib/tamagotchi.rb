class Tamagotchi

  @@tamagotchi = []

  def initialize (name)
    @name = name
    @food = 10
    @sleep = 10
    @activity = 10
    @creation_time = Time.new()
    @id = @@tamagotchi.length() + 1
  end

  def food_level
    @food
  end

  def id
    @id
  end

  def time
    @creation_time
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

  def is_alive?
    @food > 0
  end

  def set_food_level(food_amount)
    @food = food_amount
  end

  def time_passes
    difference = Time.new() - @creation_time
    if difference >= 20
      @food = @food - ((difference/20).round)
      if @food < 0
        @food = 0
      end
    end
    if difference >= 10
      @activity = @activity - ((difference/10).round)
      if @activity < 0
        @activity = 0
      end
    end
    if difference >= 30
      @sleep = @sleep - ((difference/30).round)
      if @sleep < 0
        @sleep = 0
      end
    end

  end

  def feed_pet
    self.time_passes()
    if self.is_alive?()
      @creation_time = Time.new()
      @food = @food + 1
      if @food > 10
        @food = 10
      end
    else
      "Bad Daddy"
    end
  end

  def play_with_pet
    self.time_passes()
    if self.is_alive?()
      @creation_time = Time.new()
      @activity = @activity + 1
      if @activity > 10
        @activity = 10
      end
    else
      "Bad Daddy"
    end
  end

  def put_to_sleep
    self.time_passes()
    if self.is_alive?()
      @creation_time = Time.new()
      @sleep = @sleep + 1
      if @sleep > 10
        @sleep = 10
      end
    else
      "Bad Daddy"
    end
  end

  define_method(:save) do
    @@tamagotchi.push(self)
  end

  def self.clear
    @@tamagotchi = []
  end

  define_singleton_method(:find) do |identification|
    found_pet = nil
    @@tamagotchi.each() do |pet|
      if pet.id().eql?(identification.to_i())
        found_pet = pet
      end
    end
    found_pet
  end

end
