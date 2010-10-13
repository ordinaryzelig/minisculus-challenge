require 'sspa_test'

class WindTalkerTest < SSPATest

  verify 'MarkI can solve for pristine keyboard' do
    solution = MarkI.solve_for('123abc', ['123', 'abc'])
    confirm solution.wheel_position_combinations.include?([0])
    confirm_equal '123abc', solution.message
  end

  verify 'MarkIV can solve for answer to question 4' do
    code = "WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE\"SOQTNA8A\"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I"
    clues = ['rockets', 'strike']
    wheel_positions = [7, 2]
    solution = MarkIV.solve_for(code, clues)
    confirm solution.wheel_position_combinations.include?(wheel_positions)
    confirm_equal 'The rockets will strike at coordinates 49.977984 7.9257857 422979.83 5536735.81 on Oct. 7th', solution.message
  end

end
