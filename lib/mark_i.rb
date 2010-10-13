class MarkI

  def initialize(wheel_position)
    @keyboard = Keyboard.shift(wheel_position)
  end

  class << self
    alias_method :wheel_position, :new
  end

  def encode(str)
    str.each_char.map do |char|
      @keyboard.press(char).shifted
    end.join
  end

end
