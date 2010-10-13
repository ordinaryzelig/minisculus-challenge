class Mark1

  def initialize(wheel_position)
    @decoded_character_set = Keyboard.shift(wheel_position)
  end

  class << self
    alias_method :wheel_position, :new
  end

  def encode(str)
    str.each_char.map do |char|
      @decoded_character_set[char]
    end.join
  end

end
