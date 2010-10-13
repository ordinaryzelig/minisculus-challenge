require 'sspa_test'

class KeyboardTest < SSPATest

  verify 'decoded keyboard with no shifting' do
    keyboard = Keyboard.shift(0)
    confirm not_encrypted?(keyboard)
  end

  verify 'keyboard shifted by 1' do
    keyboard = Keyboard.shift(1)
    confirm_equal 'b', keyboard.press('a').shifted
  end

  verify 'keyboard wraps around properly' do
    keyboard = Keyboard.shift(1)
    confirm_equal '0', keyboard.press(' ').shifted
  end

  verify "keyboard can return key's position in alpabet" do
    keyboard = Keyboard.shift(0)
    confirm_equal 0, keyboard.press('0').position
  end

  verify 'press key by character' do
    keyboard = Keyboard.shift(0)
    confirm keyboard.press('0').is_a?(Keyboard::Key)
  end

  verify 'press key by position in machine alphabet' do
    keyboard = Keyboard.shift(0)
    confirm keyboard.press(0).is_a?(Keyboard::Key)
  end

  verify 'press key by index wraps around properly' do
    keyboard = Keyboard.shift(0)
    confirm_equal keyboard.press(0), keyboard.press(keyboard.size)
  end

  private

  def not_encrypted?(keyboard)
    keyboard.keys.all? do |key|
      key.pressed == key.shifted
    end
  end


end
