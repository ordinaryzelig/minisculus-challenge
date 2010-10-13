class MarkI

 def initialize(wheel_position)
    @keyboard = Keyboard.shift(wheel_position)
  end

  class << self
    alias_method :with_wheel_positions, :new
  end

  def encode(str)
    str.each_char.map do |char|
      @keyboard.press(char).shifted
    end.join
  end

  def decode(str)
    str.each_char.map do |char|
      @keyboard.unshift(char).pressed
    end.join
  end

  def self.num_wheels
    instance_method(:initialize).arity
  end

end
