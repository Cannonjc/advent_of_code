class DayThree
  LOWER_ALPHA = ("a".."z").to_a.freeze
  UPPER_ALPHA = ("A".."Z").to_a.freeze
  def initialize(filename)
    @input = File.read(filename)
  end

  def items_priority_sum
    sum = 0
    @input.split("\n").each do |rucksack|
      first_comp = rucksack[0, rucksack.length/2].split("")
      second_comp = rucksack[rucksack.length/2, rucksack.length].split("")
      sum += determine_score((first_comp & second_comp).first)
    end

    sum
  end

  def group_priority_sum
    sum = 0
    @input.split("\n").each_slice(3) do |rucksack|
      sum += determine_score((rucksack[0].split("") & rucksack[1].split("") & rucksack[2].split("")).first)
    end

    sum
  end

  private

  def determine_score(letter)
    if letter == letter.upcase
      UPPER_ALPHA.index(letter) + 27
    else
      LOWER_ALPHA.index(letter) + 1
    end
  end
end
