class MarkIV < MarkII

  def encode(str)
    previous_position = 0
    str.each_char.map do |char|
      position = @keyboard.press(char).position
      shifted = @keyboard.press(position + (2 * previous_position)).shifted
      previous_position = position
      shifted
    end.join
  end

end
