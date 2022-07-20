class WordsController < ApplicationController
<<<<<<< HEAD
  before_action :validate_key
  before_action :load_word, except: [:random_word]

  def randomWord
    return render json: Word.generate_random_word
=======

  before_action :validate_key
  before_action :load_word, except: [:randomWord]

  def randomWord
    current_word = "white"
    return render json: Word.validate_word(current_word, "random_word", api_key)
>>>>>>> ae7f5bd621754dd1620e0a03462d6264a2d29006
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
<<<<<<< HEAD
  
  private

    def validate_key
      if @key = Userkey.validate_key(params[:api_key])
         @user = User.find(@key.user_id)
        if !@user_api_calls_limit_reached = @user.usage_limit_reached?
          @key.increment_key_usage
          @user.increment_api_calls_usage
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
=======

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
>>>>>>> ae7f5bd621754dd1620e0a03462d6264a2d29006
end