require './lib/hangman'
require './lib/word'

def initialize_game
  word_list = %w{
                  honorificabiltudinitatibus
                  antidisestablishmentarianism
                  floccinaucinihiliplication
                  psuedopseudohypoparathyrodism
                  pneumonoultramicroscopicsilicovolcanoconiosis
                  aequeosalinocalcalinoceraceoaluminosocupreovitriolic
                  lopadotemachoselachogaleokranioleipsanodrimhypotrimmatosilphioparaomelitokatakechymenokichlepikossyphophattoperisteralektryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon
                  methionylglutaminylarginyltyrosylglutamylserylleucylphenylalanylalanylglutaminylleucyllysylglutamylarginyllysylglutamylglycylalanylphenylalanylvalylprolylphenylalanylvalylthreonylleucylglycylaspartylprolylglycylisoleucylglutamylglutaminylserylleucyllysylisoleucylaspartylthreonylleucylisoleucylglutamylalanylglycylalanylaspartylalanylleucylglutamylleucylglycylisoleucylprolylphenylalanylserylaspartylprolylleucylalanylaspartylglycylprolylthreonylisoleucylglutaminylaspfraginylalanylthreonylleucylarginylalanylphenylalanylalanylalanylglycylvalylthreonylprolylalanylglutaminylcysteinylphenylalanylglutamylmethionylleucylalanylleucylisoleucylarginylglutaminyllysylhistidylprolylthreonylisoleucylprolylisoleucylglycylleucylleucylmethionyltyrosylalanylasparaginylleucylvalylphenylalanylasparaginyllysylglycylisoleucylaspartylglutamylphenylalanyltyrosylalanylglutaminylcysteinylglutamyllysylvalylglycylvalylaspartylserylvalylleucylvalylalanylaspartylvalylprolylvalylglutaminylglutamylserylalanylprolylphenylalanylarginylglutaminylalanylalanylleucylarginylhistidylasparaginylvalylalanylprolylisoleucylphenylalanylisoleucylcysteinylprolylprolylaspartylalanylaspartylaspartylaspartylleucylleucylarginylglutaminylisoleucylalanylseryltyrosylglycylarginylglycyltyrosylthreonyltyrosylleucylleucylserylarginylalanylglycylvalylthreonylglycylalanylglutamylasparaginylarginylalanylalanylleucylprolylleucylasparaginylhistidylleucylvalylalanyllysylleucyllysylglutamyltyrosylasparaginylalanylalanylprolylprolylleucylglutaminylglycylphenylalanylglycylisoleucylserylalanylprolylaspartylglutaminylvalyllysylalanylalanylisoleucylaspartylalanylglycylalanylalanylglycylalanylisoleucylserylglycylserylalanylisoleucylvalyllysylisoleucylisoleucylglutamylglutaminylhistidylasparaginylisoleucylglutamylprolylglutamyllysylmethionylleucylalanylalanylleucyllysylvalylphenylalanylvalylglutaminylprolylmethionyllysylalanylalanylthreonylarginylserine
     }
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
  puts @game.image
  puts @word.word_so_far.split(//).join(' ')
end

def main_menu
  draw_screen

  letter = prompt("Enter a letter:").downcase
  if letter == nil
    prompt "Please choose a letter!"
    return true
  end

  guess = @word.guess?(letter)

  if guess && @word.solved?
    draw_screen
    if prompt("You Saved Him! Play again(Y/N)?").downcase == 'y'
      initialize_game
      return true
    end
    return false
  end

  @game.bad_guess unless guess
  draw_screen

  if @game.game_over?
    if prompt("You failed! He's dead! Play again(Y/N)?").downcase == 'y'
      initialize_game
      return true
    end
    return false
  end

  return true
end

initialize_game
while main_menu
end

