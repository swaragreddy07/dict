class WordsController < ApplicationController

  before_action :validate_key
  before_action :load_word, except: [:randomWord]

  def randomWord
    current_word = "white"
    return render json: Word.validate_word(current_word, "random_word", api_key)
  end

  def definitions
    return render json: @word.definition
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

  private

  def validate_key
    @key = UserKey.validate_key(params[:api_key])

    if @key.blank?
      # error and return
    elsif @key.user.usage_limit_reached?
      # error and return
    end

    @key.increment_usage
  end

  def load_word
    @word = Word.find(params[:word])

    unless @word
      # error
    end
  end
end