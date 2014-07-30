class Hangman
  attr_reader :bad_guess_count

  def initialize
    @bad_guess_count = 0
  end

  def bad_guess
    @bad_guess_count += 1
  end

  def game_over?
    @bad_guess_count >= 6
  end

end
