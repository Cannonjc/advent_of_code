class DayTwo
  RPS_INPUT = {
    "A" => :rock,
    "X" => :rock,
    "B" => :paper,
    "Y" => :paper,
    "C" => :scissors,
    "Z" => :scissors
  }.freeze

  RPS_SCORE = {
    rock: 1,
    paper: 2,
    scissors: 3
  }.freeze

  RPS_DIRECTION = {
    "X" => :lose,
    "Y" => :draw,
    "Z" => :win
  }.freeze

  def initialize(filename)
    @input = File.read(filename)
  end

  def calculate_score(directive: false)
    total_score = 0
    @input.split.each_slice(2) do |plays|
      elf_play = RPS_INPUT[plays[0]]
      my_play = directive ? determine_my_play(elf_play, RPS_DIRECTION[plays[1]]) : RPS_INPUT[plays[1]]
      total_score += RPS_SCORE[my_play] + determine_winner_score(elf_play, my_play)
    end

    total_score
  end

  private

  def determine_winner_score(elf, mine)
    return 3 if elf == mine

    case mine
    when :rock
      return 0 if elf == :paper
      return 6 if elf == :scissors
    when :paper
      return 0 if elf == :scissors
      return 6 if elf == :rock
    when :scissors
      return 0 if elf == :rock
      return 6 if elf == :paper
    end
  end

  def determine_my_play(elf, mine)
    return elf if mine == :draw

    case mine
    when :win
      return :rock if elf == :scissors
      return :scissors if elf == :paper
      return :paper if elf == :rock
    when :lose
      return :rock if elf == :paper
      return :scissors if elf == :rock
      return :paper if elf == :scissors
    end
  end
end
