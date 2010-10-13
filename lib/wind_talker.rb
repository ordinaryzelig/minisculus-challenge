module WindTalker

  def solve_for(code, clues)
    solution = WheelPositionSolution.new
    solution.wheel_position_combinations = (0..9).to_a.repeated_permutation(num_wheels).select do |wheel_positions|
      mark_machine = with_wheel_positions(*wheel_positions)
      decoded = mark_machine.decode(code)
      clues_fit = clues.all? { |clue| decoded.include?(clue) }
      if solution.message.nil? && clues_fit
        solution.message = decoded
      end
      clues_fit
    end
    solution
  end

end

WheelPositionSolution = Struct.new(:wheel_position_combinations, :message)
