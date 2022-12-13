class DayFive
  def initialize(filename)
    @input = File.read(filename)
    @stacks = make_stacks
    @instructions = make_instructions
  end

  def move_crates
    @instructions.each do |instruction|
      instruction[0].times do
        popped = @stacks[instruction[1]-1].pop
        @stacks[instruction[2]-1].push(popped)
      end
    end
  end

  def move_stacks
    @instructions.each do |instruction|
      move_from = @stacks[instruction[1]-1].length-instruction[0]
      moving = @stacks[instruction[1]-1][move_from..-1]
      @stacks[instruction[1]-1] = @stacks[instruction[1]-1][0..move_from-1]
      @stacks[instruction[2]-1] += moving
    end
  end

  def top_crates
    @stacks.map { |stack| stack.pop }.join
  end

  private

  def make_stacks
    stacks = []
    arr = @input.split("\n")
    blank_line = arr.find_index("")
    crates = arr[0..blank_line-2]
    column_nums = arr[blank_line - 1]
    column_nums.chars.each_with_index do |value, index|
      next if value == " "

      stacks << crates.map { |c| c[index] == " " ? nil : c[index] }.compact.reverse
    end

    stacks
  end
  def make_instructions
    arr = @input.split("\n")
    blank_line = arr.find_index("")
    lines = arr[blank_line+1..-1]
    lines.map do |line|
      line.scan(/\d+/).map(&:to_i)
    end
  end
end
