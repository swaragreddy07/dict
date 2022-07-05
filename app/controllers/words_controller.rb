class WordsController < ApplicationController
  def randomWord
    a=params[:api_key]
    if a=="ace_collage"
    word = Word.all
    g=[]
    word.each do |i|
      g.append(i.word)
    end
    g.shuffle!()
    return render json: g[0]
    else
      return render json: 'invalid key'
    
   end
  
end
 def definition
  curr_word= params[:word]
  key=params[:api_key]
  if key=="ace_collage"
    definition=Word.find_by(word: curr_word)
    if definition!=nil 
      return render json: definition.def
    else
      return render json: 'word does not exist in our database'
    end
    else
  return render json: 'invalid key'
    end
end
end