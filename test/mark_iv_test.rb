require 'sspa_test'
require 'mark_iv.rb'

class MarkIVTest < SSPATest

  verify 'encodes "0123" to "0147"' do
    mark_iv = MarkIV.with_wheel_positions(0, 0)
    confirm_equal '0147', mark_iv.encode('0123')
  end

  verify 'decodes "0147" to "0123"' do
    mark_iv = MarkIV.with_wheel_positions(0, 0)
    confirm_equal '0123', mark_iv.decode('0147')
  end

end
