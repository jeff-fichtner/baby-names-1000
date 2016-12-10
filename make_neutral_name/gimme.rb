require_relative '../score/score'
require_relative '../name/name'
require_relative '../config'

class Gimme

  def create_name
    new_name = Name.new.generate
    check_against_list(new_name)
    score_name(new_name)
    print @final_name
  end

  def check_against_list(name)
    #check against list of common names
    #if list.include? name
      #create_name
    #else
      #nothing
    #end
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

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "oLBWG7i3THDSjnLvIaltzR3eb"
  config.consumer_secret     = "jbnhXXjaBR74kISmm3wvuoHCl6doBtmgSeETOJqfTcuqzRDq4i"
  config.access_token        = "807668096534192128-iV0vcWPLlDVga03h9ra0aWWWjwp67Zz"
  config.access_token_secret = "lSkpCPu4VYqBgzIbGtUjhhuM9BW7Rq3GrUN9XFIVxo1r8"
end


client.update(output)
