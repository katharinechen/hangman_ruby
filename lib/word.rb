class Word
  attr_reader :word, :word_so_far

  def initialize(word)
    @word = word
    @word_so_far =  "_" * @word.length
  end

  def guess?(letter)

    if @word.include?(letter[0])
      a = (0...@word.length).find_all { |i| @word[i] == letter }
      a.each { |x| @word_so_far[x] = letter }
    end

    @word.include?(letter[0])
  end

  def solved?
    @word == @word_so_far
  end

end

