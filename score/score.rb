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
    check_accent
    check_number_phenomes
    check_last_phenome
    return @score
  end

  def check_accent
    check_number_syllables
    check_where_accent_is
  end

  def check_last_phenome
    check_schwa
    check_other_vowel
    check_th
    check_stop_consonant
  end

  def check_number_syllables
  #obvi this will need to be changed
    #if number_syllables == 1
      @score -= 1
    #elsif number_syllables > 1 && accent > 1
      #@score += 2 
    #elsif number_syllables == 2
      #if accent is on 1st && number_phenomes >= 6
        #@score -= 2 
    #elsif number_syllables >= 3 && accent == 1 
      #@score += 1
    #end
  end

  def check_where_accent_is
  end

  def check_number_phenomes
    phenome_count = 0
    phenomes = ["b","d","f","g","h","j","k","l","m","n","p","r","s","t","v","w","y","z"]
    combo_phenomes = ["ng","ch","sh","th"]
    
    @broken.each do |x|
      if phenomes.include? x
        phenome_count += 1
      end
    end

    orig_name = @broken.join ""
    puts orig_name
    combo_phenomes.each do |x|
      if orig_name.include? x 
        phenome_count -= 1
      end
    end 
  end

  def check_schwa
    if @broken.last == "a"
      @score += 2
    end
  end

  def check_other_vowel
    vowels = ["e","i","o","u","y"]
    if vowels.include? @broken.last
      @score += 1
    end
  end

  def check_th
    th = ["s","z","f","v","th","ch","zh","dzh"]
    if th.include? @broken.last
      @score -= 1
    end
  end

  def check_stop_consonant
    stop_consonant = ["p","b","t","d","k","g"]
    if stop_consonant.include? @broken.last
      @score -= 2
    end
  end

end
