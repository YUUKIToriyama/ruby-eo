class Esperanto < String
	def is_pol? #複数形かどうか(plural form)
	 if self[-2] + self[-1] == "oj"
		return true
	 else
		return false
	 end
	end
	def is_female?
		word = self.to_singular
		if word.end_with?("ino") || word.end_with?("ina")
			return true
		else
			return false
		end
	end
	def is_noun? #名詞かどうか
	 if self[-1] == "o" || self[-2] == "o"
		return true
	 else
		return false
	 end
	end
	def is_adj? #形容詞かどうか
	 if self[-1] == "a" || self[-2] == "a"
		return true
	 else
		return false
	 end
	end
	def is_adv? #副詞かどうか
	 if self[-1] == "e" || self[-2] == "e"
		return true
	 else
		return false
	 end
	end
	def is_inf? #動詞の原形(infinitive)
	 if self[-1] == "i"
	   return true
	 else
	   return false
	 end
	end
	def is_past? #過去形かどうか
	 if self[-2] + self[-1] == "is"
	 	return true
	 else
		return false
	 end
	end
	def is_present? #現在形かどうか
	 if self[-2] + self[-1] == "as"
		return true
	 else
		return false
	 end
	end
	def is_future? #未来形かどうか
	 if self[-2] + self[-1] == "os"
		return true
	 else
		return false
	 end
	end
	def is_imp? #命令形(imperative)かどうか
	 if self[-1] == "u"
		return true
	 else
		return false
	 end
	end
	def is_conditional? #叙想形かとうか
	 if self[-2] + self[-1] == "us"
		return true
	 else
		return false
	 end
	end
	def is_verb? #動詞かどうか
	 if self.is_inf? || self.is_past? || self.is_present? || self.is_future? || self.is_imp? || self.is_conditional
		return true
	 else
		return false
	 end
	end
	def is_negative? ##
	 if self.is_verb? && self[0] + self[1] == "ne"
		return true
	 else
		return false
	 end
	end
	def is_opposite? ##反意語かどうか(接頭辞mal-を伴うかどうか)
	 if self[0] + self[1] + self[2] == "mal"
		return true
	 else
		return false
	 end
	end
	def to_plural #名詞、形容詞を複数形に変換します。もともと複数形になっている場合は入力値をそのまま返します
		if self.is_noun? || self.is_adj?
			if self.end_with?("j")
				return self
			else
				return self + "j"
			end
		end
	end
	def to_singular #名詞、形容詞を単数形に変換します。もともと単数形の場合は入力値をそのまま返します
		if self.is_noun? || self.is_adj?
			if self.end_with?("j")
				return self.sub(/j$/, "")
			else
				return self
			end
		end
	end
	def make_opposite #反意語をつくる
	 if (!self.is_opposite?)
		 prefix = "mal"
		 temp = prefix + self
		 return temp
	 else
		return self.sub(/^mal/, "")
	 end
	end
	def make_female #男性形の単数名詞が来たら女性形の単数を返し、男性形の複数形容詞が来たら女性形の複数形容詞を返すようにしてあります
	 if (!self.is_female?)
		word = self.to_singular
		if self.is_noun?
			word = word.sub(/o$/, "ino")
			if self.end_with?("j")
				return word.to_plural
			else
				return word
			end
		elsif self.is_adj?
			word = word.sub(/a$/, "ina")
			if self.end_with?("j")
				return word.to_plural
			else
				return word
			end
		end
	 else
		return "#{self} is already female form"
	 end
	end
	def to_s
	 String.new self
	end
end

class String
 def to_eo
  Esperanto.new self
 end
end
