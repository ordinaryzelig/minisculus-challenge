require 'sspa_test'
require 'mark_2.rb'

class Mark2Test < SSPATest

  verify 'encodes "abc" to "STU"' do
    mark_2 = Mark2.wheel_positions(2, 5)
    confirm_equal 'STU', mark_2.encode('abc')
  end

end
