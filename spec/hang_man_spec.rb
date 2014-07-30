require 'rspec'
require 'word'
require 'hang_man'

describe :Word do
  describe :initialize do
    it "should initialize with a hang_man word" do
      expect(Word.new("epicodus")).to be_an_instance_of Word
    end
  end

  describe :word do
    it "should return the word for this game" do
      expect(Word.new("epicodus").word).to eq ('epicodus')
    end
  end

  describe :word_so_far do
    it "should return a string of _ equal to the number of characters in the word" do
      expect(Word.new("epicodus").word_so_far).to eq("________")
    end
  end

  describe :guess? do
    it "should allow you to guess a character and tell you true if the letter is include in the word" do
      new_word = Word.new("epicodus")
      expect(new_word.guess?("e")).to eq true
    end

    it "updates the progress made toward solving this word" do
      new_word = Word.new("epicodus")
      new_word.guess?('e')
      expect(new_word.word_so_far).to eq('e_______')
    end

    it "updates the progress made toward solving this word: 2 guesses" do
      new_word = Word.new("epicodus")
      new_word.guess?('e')
      new_word.guess?('s')
      expect(new_word.word_so_far).to eq('e______s')
    end
  end

  describe :won? do
    it "should result true if player guessed all of the letters of the word" do
      new_word = Word.new("hi")
      new_word.guess?('h')
      new_word.guess?('i')
      expect(new_word.won?).to eq true
    end
  end
end
