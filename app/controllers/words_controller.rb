class WordsController < ApplicationController
  def randomWord
    word = Word.new
    api_key = word.key_is_prsent(params[:api_key], session[:id])
    if api_key == true
      word = Word.all
      words = []
      word.each do |i|
        words.append(i.word)
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
    word = Word.new
    api_key = word.key_is_prsent(params[:api_key], session[:id])
    curr_word = params[:word]
    if api_key == true
      word = Word.find_by(word: curr_word)
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
    word = Word.new
    api_key = word.key_is_prsent(params[:api_key], session[:id])
    curr_word = params[:word]
    if api_key == true
     word = Word.find_by(word: curr_word)
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

  def related
    word = Word.new
    api_key = word.key_is_prsent(params[:api_key], session[:id])
    curr_word= params[:word]
    if api_key == true
      word = Word.find_by(word: curr_word)
    if word == nil
      return render json: 'the word does not exist in our database'
    else
      return render json: word.related
    end
    elsif api_key == 1
      return render json: "You cannot make anymore api calls today"
    else
      return render json: 'invalid key'
    end
  end
end