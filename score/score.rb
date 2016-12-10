class Score

  def get_score(input, incoming_score=0)
    name = input
    @score = incoming_score.to_i
    break_down_name(name)
    check_score(name)
  end

  def break_down_name(name)
    @broken = name.split ""
  end

  def check_score(name)
    check_number_syllables
    check_number_phenomes
    check_last_phenome
    puts @score
  end

  def check_last_phenome
    check_schwa
    check_other_vowel
    check_th
  end

  def check_number_syllables
  #obvi this will need to be changed
    @score += 1
  end

  def check_number_phenomes
  
  end

  def check_schwa
    if @broken.last == "a"
      @score += 1
    end
  end

  def check_other_vowel
  end

  def check_th
  end

end
