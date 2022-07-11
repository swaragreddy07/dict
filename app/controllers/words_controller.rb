class WordsController < ApplicationController
  def key_is_prsent(api_key)
    user = User.find(session[:id])
    keys = JSON.parse user.keys
    if user.plan == '1'
      usage = 500
    elsif user.plan == '2'
      usage = 2000
    else
      usage = 10000
    end
    if user.total>= usage
      return 1
    else
      present = false
      count = JSON.parse user.count
      for i in 0..keys.length()-1
        if keys[i] == api_key
          present = true
          count[i] = count[i]+1
          user.count = count.inspect
          user.total = user.total+1
          user.save
          break
        end
      end
    end
    return present
  end
  
  def randomWord
    api_key = key_is_prsent(params[:api_key])
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
    api_key = key_is_prsent(params[:api_key])
    curr_word = params[:word]
    if api_key == true
      definition = Word.find_by(word: curr_word)
    if definition!= nil 
      return render json: definition.def
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
    api_key = key_is_prsent(params[:api_key])
    curr_word = params[:word]
    if api_key == true
     example = Word.find_by(word: curr_word)
    if example == nil
      return render json: 'word does not exist in our database'
    else
      return render json: example.exam 
    end
    elsif api_key == 1
      return render json: "You cannot make anymore api calls today"
    else
      return render json: 'invalid key', status: 401
    end
  end

  def related
    api_key = key_is_prsent(params[:api_key])
    curr_word= params[:word]
    if api_key == true
      related_words = Word.find_by(word: curr_word)
    if related_words == nil
      return render json: 'the word does not exist in our database'
    else
      return render json: related_words.related
    end
    elsif api_key == 1
      return render json: "You cannot make anymore api calls today"
    else
      return render json: 'invalid key'
    end
  end
end