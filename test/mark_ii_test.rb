require 'sspa_test'
require 'mark_ii.rb'

class MarkIITest < SSPATest

  verify 'encodes "abc" to "STU"' do
    mark_ii = MarkII.with_wheel_positions(2, 5)
    confirm_equal 'STU', mark_ii.encode('abc')
  end

  verify 'decodes "STU" to "abc"' do
    mark_ii = MarkII.with_wheel_positions(2, 5)
    confirm_equal 'abc', mark_ii.decode('STU')
  end

  verify 'num_wheels is 2' do
    confirm_equal 2, MarkII.num_wheels
  end

end
