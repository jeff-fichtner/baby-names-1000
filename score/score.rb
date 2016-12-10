require_relative '../syllable_parser'

class Score
  attr_reader :name, :broken
  attr_accessor :score, :phenome_count
  include SyllableParser

  def get_score(name)
    @name = name
    @score = 0
    break_down_name(name)
    check_score(name)
  end

  def break_down_name
    @broken = name.split ""
  end

  def check_score
    check_accent
    check_number_phenomes
    check_last_phenome
    return score
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
    number_syllables = SyllableParser.run(name).length
    if number_syllables == 1
      @score -= 1
    elsif number_syllables == 2 && @phenome_count >= 6
      @score -= 2
    elsif number_syllables == 3
      @score += 1
    elsif number_syllables < 3
      @score += 2
    end
  end

  def check_where_accent_is
    #add login here
    #@accent = 1 (# of syllable at which emphasis occurs)
  end

  def check_number_phenomes
    @phenome_count = 0
    phenomes = ["b","d","f","g","h","j","k","l","m","n","p","r","s","t","v","w","y","z"]
    combo_phenomes = ["ng","ch","sh","th"]
    
    @broken.each do |x|
      if phenomes.include? x
        @phenome_count += 1
      end
    end

    orig_name = @broken.join ""
    combo_phenomes.each do |x|
      if orig_name.include? x 
        @phenome_count -= 1
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
