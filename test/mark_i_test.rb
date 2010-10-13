require 'sspa_test'
require 'mark_i.rb'

class MarkITest < SSPATest

  verify 'encodes "ac" to "fh"' do
    mark_i = MarkI.with_wheel_positions(5)
    confirm_equal 'fh', mark_i.encode('ac')
  end

  verify 'decodes "fh" to "ac"' do
    mark_i = MarkI.with_wheel_positions(5)
    confirm_equal 'ac', mark_i.decode('fh')
  end

  verify 'num_wheels is 1' do
    confirm_equal 1, MarkI.num_wheels
  end

end
