require_relative 'names'

module SyllableParser

	def self.run(word)
		word = word.downcase
		string = ""
		until word.length == 0
			if vowel?(word.chr)
				cluster_length = syllable?(word)
				cluster_length.times { string << word.slice!(0) }
				if word.length > 1
					string << "-"
				end
			else
				string << word.slice!(0)
			end
		end
		string.split('-')
	end

	def self.syllable?(word)
		last = 1
		if word[last].nil? || vowel?(word[last])
			last = 0
		elsif !word[last + 1].nil?
			if vowel?(word[last + 1]) && word[last] != word.chr
				last = 0
			end
		end

		return last + 1
	end

	def self.vowel?(letter)
		return letter =~ /[aeiouy]/
	end
end


# if i != 0 && vowel?(chars[i - 1]) && !vowel?(chars[i]) && !vowel?(chars[i + 1])
# 	i.times { |i| word_string << chars.shift }
# 	word_string << '-' unless chars[i + 1].nil?
# 	i = 0
# else
# 	i += 1
# end
# chars.length.times { |i| word_string << chars.shift } if i == chars.length
