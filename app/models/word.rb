class Word < ApplicationRecord
    def self.validate_word(current_word, user_request, key_validation)
      if key_validation == true
        word = Word.find_by(word: current_word)
      if word!= nil 
        if user_request == 1
          return word.definition
        elsif user_request == 2
          return word.example
        else 
          return word.relatedwords
        end
      else 
        return 'word does not exist in our database'
      end
      elsif key_validation == 1
        return "You cannot make anymore api calls today"
      else
        return 'invalid key'
      end
    end
end
