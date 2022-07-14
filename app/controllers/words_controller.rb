class WordsController < ApplicationController
  def randomWord
    key = Userkey.new
    api_key = key.key_is_prsent(params[:api_key])
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
    key = Userkey.new
    api_key = key.key_is_prsent(params[:api_key])
    current_word = params[:word]
    if api_key == true
      word = Word.find_by(word: current_word)
    if word!= nil 
      return render json: word.definition
    else
      return render json: 'word does not exist in our database'
    end
    elsif api_key == 1
      return render json: "You cannot make anymore api calls today"
    else
      return render json: 'invalid key'
    end
  end

  def examples
    key = Userkey.new
    api_key = key.key_is_prsent(params[:api_key])
    current_word = params[:word]
    if api_key == true
     word = Word.find_by(word: current_word)
    if word == nil
      return render json: 'word does not exist in our database'
    else
      return render json: word.example
    end
    elsif api_key == 1
      return render json: "You cannot make anymore api calls today"
    else
      return render json: 'invalid key', status: 401
    end
  end

  def relatedwords
    key = Userkey.new
    api_key = key.key_is_prsent(params[:api_key])
    current_word = params[:word]
    if api_key == true
      word = Word.find_by(word: current_word)
    if word == nil
      return render json: 'the word does not exist in our database'
    else
      return render json: word.relatedwords
    end
    elsif api_key == 1
      return render json: "You cannot make anymore api calls today"
    else
      return render json: 'invalid key'
    end
  end
end