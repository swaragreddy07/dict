class WordsController < ApplicationController
  before_action :validate_key
  before_action :load_word, except: [:randomWord]

  def randomWord
    return render json: Word.generate_random_word
  end

  def definitions
    return render json: @word.definition
  end

  def examples
    return render json: @word.example
  end

  def relatedwords
    return render json: @word.relatedwords
  end
  
  private

  def validate_key
    if key = Userkey.validate_key(params[:api_key])
      user = key.user
      if !user.usage_limit_reached?
        key.increment_key_usage
        user.increment_api_calls_usage
      else
        return render json: "you cannot make any more api calls today"
      end
    else
      return render json: "invalid key"
    end
  end
   
  def load_word
    @word = Word.find_by(word: params[:word])
    if !@word
      return render json: "word does not exist in our database"
    end
  end
end