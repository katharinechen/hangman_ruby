require './lib/hangman'
require './lib/word'

def initialize
  word_list = %w{ random hello hangman justin katharine }
  @word = Word.new(word_list[rand(word_list.length)])
  @game = Hangman.new
end

def prompt(message)
  print message
  gets.chomp
end

def draw_screen
  system "clear"
  puts "*" * 80
  puts "*" + " " * 35 + "Hangman!" + " " * 35 + "*"
  puts "*" * 80
  puts @word.word_so_far.split(//).join(' ')
end

def main_menu
  draw_screen
  guess = @word.guess?(prompt("Enter a letter:"))

  if guess && @word.solved?
    draw_screen
    prompt "You win!"
    return false
  end

  @game.bad_guess unless guess
  if @game.game_over?
    prompt "LOSER!"
    return false
  end

  return true
end

initialize
while main_menu
end
