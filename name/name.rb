class Name

  def generate 
    begin_vowels= ['a','o','u','e','i']
    mid_vowels= ['a','e','i','o','u','ai','ou','oo','oi','ee']
    end_vowels= ['e','i']
    consonant_beginnings= ['br','bl',
      'ch','cr','chr','cl','chl',
      'd','dr','dw',
      'fr','fl',
      'gr','gl',
      'h',
      'j',
      'kr',
      'm',
      'n',
      'pr','pl','ph','phr',
      'qu',
      'r',
      'sch','schr','sc','sh','sk','sl','sm','sn','sp','st','sw','sph','shr','spr','squ',
      'th','tr','tw','thr','thw',
      'v','vl',
      'wr','wh',
      'x',
      'y',
      'z']
   
    consonant_endings= ['b',
      'ch','ck',
      'd',
      'f','ff',
      'g',
      'h',
      'j',
      'k',
      'l','ll','lp','lf','lt',
      'm',
      'n',
      'p','pt',
      'rk','rc','rt',
      's','ss','st',
      't','tt',
      'v',
      'w',
      'x',
      'y',
      'z','zz']
     
    cointoss = [0..2].sample
   
    if cointoss == 0
        name = consonant_beginnings.sample + mid_vowels.sample + consonant_endings.sample
    elsif cointoss == 1
          name = consonant_beginnings.sample + mid_vowels.sample + consonant_endings.sample + end_vowels.sample
    else
        name = begin_vowels.sample + consonant_endings.sample + end_vowels.sample
    end
    puts name

  end

end
Name.new.generate
