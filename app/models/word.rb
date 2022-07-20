class Word < ApplicationRecord

  def self.generate_random_word
    all_words = Word.all
    words = []
    all_words.each do |word|
      words.append(word.word)
    end
    words.shuffle!()
    return words[0]
  end

end