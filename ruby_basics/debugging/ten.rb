# 10. Warriors and Wizards
# We started writing an RPG game, but we already run into an error message. Find the problem and fix it.

# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
# input = gets.chomp.downcase # original code
input = gets.chomp.downcase.to_sym # corrected code

# player.merge(character_classes[input]) # original code
player.merge!(character_classes[input]) # correct code if want 'player' hash mutated
# new_player = player.merge(character_classes[input]) # alternate code without mutating.

puts 'Your character stats:'
puts player # mutated 'player'
# puts new_player # non-mutated

# issue is with the '.merge' method "no implicit conversion of nil into Hash (TypeError)"
# the input is a string, but the keys for the hashes are all symbols. So the hash call to merge is not pulling a value.
# the input needs to be converted to a symbol before it is used in '.merge'
