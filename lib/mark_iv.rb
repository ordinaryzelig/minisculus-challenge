class MarkIV < MarkII

  def encode(str)
    previous_position = 0
    str.each_char.map do |char|
      position = @keyboard.press(char).position
      key = @keyboard.key_at(position + (2 * previous_position))
      previous_position = position
      key.shifted
    end.join
  end

  def decode(str)
    previous_position = 0
    str.each_char.map do |char|
      raw_position = @keyboard.unshift(char).position
      key = @keyboard.key_at(raw_position - (2 * previous_position))
      previous_position = key.position
      key.pressed
    end.join
  end

end
