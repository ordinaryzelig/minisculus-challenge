require 'sspa_test'
require 'mark_ii.rb'

class MarkIITest < SSPATest

  verify 'encodes "abc" to "STU"' do
    mark_ii = MarkII.wheel_positions(2, 5)
    confirm_equal 'STU', mark_ii.encode('abc')
  end

end
