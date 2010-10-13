require 'sspa_test'
require 'mark_i.rb'

class MarkITest < SSPATest

  verify 'encodes "ac" to "fh"' do
    mark_i = MarkI.wheel_position(5)
    confirm_equal 'fh', mark_i.encode('ac')
  end

end
