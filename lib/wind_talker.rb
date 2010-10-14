module WindTalker

  def solve_for(code, clues)
    solution = WheelPositionSolution.new
    solution.wheel_position_combinations = permute.select do |wheel_positions|
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

  def permute(&block)
    enum = Enumerator.new do |yielder|
      (0..9).to_a.repeated_permutation(num_wheels).each do |wheel_positions|
        yielder << wheel_positions
      end
    end
    block_given? ? enum.each(&block) : enum
  end

end

WheelPositionSolution = Struct.new(:wheel_position_combinations, :message)
