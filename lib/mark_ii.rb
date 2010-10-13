class MarkII < MarkI

  def initialize(wheel_position_1, wheel_position_2)
    super wheel_position_1 - (wheel_position_2 * 2)
  end

end
