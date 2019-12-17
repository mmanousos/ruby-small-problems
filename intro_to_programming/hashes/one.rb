
=begin
Given a hash of family members, with keys as the title and an array of names as the values,
use Ruby's built-in select method to gather only immediate family members' names into a new array.
=end

# Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

# immediate family members are only sisters & brothers

immediate_fam = []

family.select { |key, val|
	if (key == :sisters) || (key == :brothers)
		val.each { |name|
			immediate_fam << name
		}
	end
}

puts immediate_fam
