require 'sspa_test'
require 'mark_1.rb'

class Mark1Test < SSPATest

  verify 'encodes "ac" to "fh"' do
    mark_1 = Mark1.wheel_position(5)
    confirm_equal 'fh', mark_1.encode('ac')
  end

end
