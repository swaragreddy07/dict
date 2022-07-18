class WordsController < ApplicationController
  def randomWord
    api_key = Userkey.validate_key(params[:api_key])
    current_word = "white"
    return render json: Word.validate_word(current_word, "random_word", api_key)
  end

  def definitions
    api_key = Userkey.validate_key(params[:api_key])
    current_word = params[:word]
    return render json: Word.validate_word(current_word, "word_definitions", api_key)
  end

  def examples
    api_key = Userkey.validate_key(params[:api_key])
    current_word = params[:word]
    return render json: Word.validate_word(current_word, "word_examples", api_key)
  end

  def relatedwords
    api_key = Userkey.validate_key(params[:api_key])
    current_word = params[:word]
    return render json: Word.validate_word(current_word, "related_words", api_key)
  end
end