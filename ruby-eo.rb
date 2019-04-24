class Esperanto < String
	def is_pol? #複数形かどうか(plural form)
	 if self[-2] + self[-1] == "oj"
		return true
	 else
		return false
	 end
	end
	def is_female? #女性形かどうか
	 if self[-3] + self[-2] + self[-1] == "ino" || self[-3] + self[-2] + self[-1] == "ina"
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
	def make_opposite #反意語をつくる
	 if (!self.is_opposite?)
		 prefix = "mal"
		 temp = prefix + self
		 return temp
	 else
		return self.sub(/^mal/, "")
	 end
	end
	def make_female #女性形にする
	 if (!self.is_female?)
		if self.is_noun?
		 self[-1] = ''
		 return self + "ino"
		elsif self.is_adj?
		 self[-1] = ''	
		 return self + "ina"
		else
		 return "#{self} is not noun or adjective"
		end
	 else
		return "#{self} is already female noun or adjective"
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
