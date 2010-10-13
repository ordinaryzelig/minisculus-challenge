require 'sspa_test'

class KeyboardTest < SSPATest

  verify 'decoded keyboard with no shifting' do
    decoded_keyboard = Keyboard.shift(0)
    confirm not_encrypted?(decoded_keyboard)
  end

  verify 'decoded keyboard shifted by 1' do
    decoded_keyboard = Keyboard.shift(1)
    confirm_equal 'b', decoded_keyboard['a']
  end

  verify 'keyboard wraps around properly' do
    decoded_keyboard = Keyboard.shift(1)
    confirm_equal '0', decoded_keyboard[' ']
  end

  def not_encrypted?(keyboard)
    keyboard.all? do |encoded, decoded|
      encoded == decoded
    end
  end

end
