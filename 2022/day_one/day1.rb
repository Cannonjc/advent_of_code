class DayOne
  def initialize(file_name)
    @input = File.read(file_name)
  end

  def top_calories_sum(number_of_elves=1)
    elves_counted = []
    array_input.each do |elf|
      elves_counted << elf.reduce(:+)
    end

    elves_counted.sort.reverse[0..(number_of_elves-1)].reduce(:+)
  end

  private

  def array_input
    @array_input ||= @input.split("\n\n").map { |elf| elf.split("\n").map(&:to_i) }
  end
end
