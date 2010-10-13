class Keyboard < Hash

  def self.pristine
    @keyboard ||= [
      "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
      "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
      "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
      "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
      "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
      ".", ",", "?", "!", "'", "\"", " "
    ].freeze
  end

  def self.shift(wheel_position)
    pristine.inject({}) do |hash, char|
      index_of_decoded_character = (pristine.index(char) + wheel_position) % pristine.size
      decoded_character = pristine[index_of_decoded_character]
      hash[char] = decoded_character
      hash
    end.freeze
  end

end
