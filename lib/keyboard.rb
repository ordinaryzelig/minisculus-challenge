class Keyboard

  attr_reader :character_set
  alias :keys :character_set

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

  def initialize(character_set)
    @character_set = character_set.freeze
  end

  def self.shift(wheel_position)
    character_set = pristine.inject([]) do |character_set, char|
      key = Key.new
      key.pressed = char
      index_of_decoded_character = (pristine.index(char) + wheel_position) % pristine.size
      key.shifted = pristine[index_of_decoded_character]
      key.position = character_set.size
      character_set << key
      character_set
    end
    Keyboard.new(character_set)
  end

  def press(character)
    key = @character_set.detect { |key| key.pressed == character }
    raise ArgumentError.new("no key for #{character}") unless key
    key
  end

  def unshift(character)
    key = @character_set.detect { |key| key.shifted == character }
    raise ArgumentError.new("no key shifted to #{character}") unless key
    key
  end

  def key_at(position)
    @character_set[position % size]
  end

  def size
    @character_set.size
  end

  Key = Struct.new(:pressed, :shifted, :position)

end
