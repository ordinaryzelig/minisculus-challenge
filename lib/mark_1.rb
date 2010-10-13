class Mark1

  def initialize(wheel_position)
    @decoded_character_set = Keyboard.shift(wheel_position)
  end

  def self.wheel_position(wheel_position)
    new(wheel_position)
  end

  def encode(str)
    str.each_char.map do |char|
      @decoded_character_set[char]
    end.join
  end

end
