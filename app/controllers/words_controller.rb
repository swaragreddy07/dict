class WordsController < ApplicationController
  def randomWord
    api_key = Userkey.validate_key(params[:api_key])
    if api_key == true
      all_words = Word.all
      words = []
      all_words.each do |word|
        words.append(word.word)
      end
      words.shuffle!()
      return render json: words[0]
    elsif api_key == 1
      return render json: "You cannot make anymore api calls today"
    else
      return render json: 'invalid key'
    end
  end

  def definitions
    api_key = Userkey.validate_key(params[:api_key])
    current_word = params[:word]
    return render json: Word.validate_word(current_word, 1, api_key)
  end

  def examples
    api_key = Userkey.validate_key(params[:api_key])
    current_word = params[:word]
    return render json: Word.validate_word(current_word, 2, api_key)
  end

  def relatedwords
    api_key = Userkey.validate_key(params[:api_key])
    current_word = params[:word]
    return render json: Word.validate_word(current_word, 3, api_key)
  end
end