require_relative '../score/score'
require_relative '../name/name'
require_relative '../config'
require_relative '../name/5000-common-names'
require_relative '../name/5000-common-words'

class Gimme

  def create_name
    new_name = Name.new.generate
    check_against_lists(new_name)
    score_name(new_name)
    print @final_name
  end

  def check_against_lists(name)
    if 5000_common_names.include? name
      create_name
    elsif 5000_common_words.include? name
      #create_name
    end
  end


  def score_name(name)
    verdict = Score.new.get_score(name)
    if verdict > -3 && verdict < 3
      @final_name = name
    else
      @final_name = verdict
      #create_name
    end
  end

end

output = Gimme.new.create_name
