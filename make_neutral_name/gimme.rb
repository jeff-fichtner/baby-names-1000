require_relative '../score/score'
require_relative '../name/name'
require_relative '../config'
require_relative '../name/fivek-common-names'
require_relative '../name/fivek-common-words'

class Gimme

  def create_name
    new_name = Name.new.generate
    check_against_lists(new_name)
    score_name(new_name)
  end
  
  def check_against_lists(name)
    common_names = CommonNames.new
    common_words = CommonWords.new
    if common_names.names.include? name
      create_name
    elsif common_words.words.include? name
      create_name
    end
  end

  def score_name(name)
    verdict = Score.new.get_score(name)
    if verdict > -3 && verdict < 3
      @final_name = name
    else
      create_name
    end
  end

end

output = Gimme.new.create_name
