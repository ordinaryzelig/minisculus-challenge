class Mark2 < Mark1

  def initialize(wheel_position_1, wheel_position_2)
    super wheel_position_1 - (wheel_position_2 * 2)
  end

  class << self
    alias_method :wheel_positions, :new
  end

end
