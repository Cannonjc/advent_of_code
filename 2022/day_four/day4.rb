class DayFour
  def initialize(filename)
    @input = File.read(filename)
  end

  def find_elf_pairs
    pairs = 0
    @input.split("\n").each do |assignments|
      assign1, assign2 = assignments.split(",")
      pairs += 1 if determine_contained(assign1, assign2)
    end

    pairs
  end

  def find_elf_overlaps
    overlaps = 0
    @input.split("\n").each do |assignments|
      assign1, assign2 = assignments.split(",")
      overlaps += 1 if determind_overlap(assign1, assign2)
    end

    overlaps
  end


  private

  def determine_contained(assignment1, assignment2)
    first_first, first_second = assignment1.split("-").map(&:to_i)
    second_first, second_second = assignment2.split("-").map(&:to_i)
    return true if first_first == second_first || first_second == second_second

    return true if first_first < second_first && first_second > second_second
    return true if second_first < first_first && second_second > first_second

    false
  end

  def determind_overlap(assignment1, assignment2)
    first_first, first_second = assignment1.split("-").map(&:to_i)
    second_first, second_second = assignment2.split("-").map(&:to_i)
    return false if first_second < second_first || second_second < first_first

    true
  end
end
