=begin
Problem
Encrypted Pioneers
The following list contains the names of individuals who are pioneers in the
field of computing or that have had a significant influence on the field.
The names are in an encrypted form, though, using a simple (and incredibly
  weak) form of encryption called Rot13 (https://en.wikipedia.org/wiki/ROT13).

Write a program that deciphers and prints each of these names.

Example / Tests

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Data Structure

Algorithm
  BEGIN
  create a hash with each letter and its corresponding position in the alphabet
  split the string into an array by character.
    iterate over the array examining each character.
    map
    if it is <= 'm', check the hash, add 13 and replace the letter
    if it is > 'm', subtract 13 and replace the letter
    keep ' ' as ' '
    join array to string & capitalize before printing
  END

=end

# works but does not account for non-capitalized names & checks for spaces and
# hyphens longform.
# ALPHABET = { 1 => 'a', 2 => 'b', 3 => 'c', 4 => 'd', 5 => 'e', 6 => 'f',
#              7 => 'g', 8 => 'h', 9 => 'i', 10 => 'j', 11 => 'k', 12 => 'l',
#              13 => 'm', 14 => 'n', 15 => 'o', 16 => 'p', 17 => 'q', 18 => 'r',
#              19 => 's', 20 => 't', 21 => 'u', 22 => 'v', 23 => 'w', 24 => 'x',
#              25 => 'y', 26 => 'z' }
#
# def rot13(name)
#   characters = name.downcase.chars
#   decrypted = characters.map do |character|
#     if character == ' ' || character == '-'
#       character
#     elsif ALPHABET.key(character) <= 13
#       ALPHABET[(ALPHABET.key(character) + 13)]
#     else
#       ALPHABET[(ALPHABET.key(character) - 13)]
#     end
#   end
#   puts decrypted.join.split.map { |name| name.capitalize }.join(' ')
# end

# Accounts for all punctuation and maintains proper capitalization, but is very
# long
# ALPHABET = { 1 => 'a', 2 => 'b', 3 => 'c', 4 => 'd', 5 => 'e', 6 => 'f',
#              7 => 'g', 8 => 'h', 9 => 'i', 10 => 'j', 11 => 'k', 12 => 'l',
#              13 => 'm', 14 => 'n', 15 => 'o', 16 => 'p', 17 => 'q', 18 => 'r',
#              19 => 's', 20 => 't', 21 => 'u', 22 => 'v', 23 => 'w', 24 => 'x',
#              25 => 'y', 26 => 'z' }
#
# ALPHABET_UPCASE = { 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D', 5 => 'E', 6 => 'F',
#                     7 => 'G', 8 => 'H', 9 => 'I', 10 => 'J', 11 => 'K',
#                     12 => 'L', 13 => 'M', 14 => 'N', 15 => 'O', 16 => 'P',
#                     17 => 'Q', 18 => 'R', 19 => 'S', 20 => 'T', 21 => 'U',
#                     22 => 'V', 23 => 'W', 24 => 'X', 25 => 'Y', 26 => 'Z' }
#
# def rot13(name)
#   decrypted = name.chars.map do |character|
#     number = character.ord
#     if character =~ /[\p{P}\s]/
#       character
#     elsif (97..109).include?(number)
#       ALPHABET[(ALPHABET.key(character) + 13)]
#     elsif (110..122).include?(number)
#       ALPHABET[(ALPHABET.key(character) - 13)]
#     elsif (65..77).include?(number)
#       ALPHABET_UPCASE[(ALPHABET_UPCASE.key(character) + 13)]
#     else
#       ALPHABET_UPCASE[(ALPHABET_UPCASE.key(character) - 13)]
#     end
#   end
#   puts decrypted.join
# end

def get_letter(char)
  if char <= 'm'
    char.tr('abcdefghijklm', 'nopqrstuvwxyz')
  else
    char.tr('nopqrstuvwxyz', 'abcdefghijklm')
  end
end

# def rot13(name)
#   decrypted = name.chars.map do |character|
#     if character =~ /[\p{P}\s]/
#       character
#     elsif character.upcase == character
#       get_letter(character.downcase).upcase
#     else
#       get_letter(character)
#     end
#   end
#   puts decrypted.join
# end

# def rot13(name)
#   decrypted = name.chars.map do |char|
#     case
#     when char =~ /[\p{P}\s]/  then char
#     when char.upcase == char  then get_letter(char.downcase).upcase
#     else                      get_letter(char)
#     end
#   end
#   puts decrypted.join
# end

def get_character(chr)
  case
  when chr =~ /[\p{P}\s]/   then chr
  when chr.upcase == chr    then get_letter(chr.downcase).upcase
  else                      get_letter(chr)
  end
end

def rot13(name)
  new_name = name.each_char.reduce('') do |result, character|
    result + get_character(character)
  end
  puts new_name
end

rot13('Nqn Ybirynpr')
rot13('Tenpr Ubccre')
rot13('Nqryr Tbyqfgvar')
rot13('Nyna Ghevat')
rot13('Puneyrf Onoontr')
rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
rot13('Wbua Ngnanfbss')
rot13('Ybvf Unvog')
rot13('Pynhqr Funaaba')
rot13('Fgrir Wbof')
rot13('Ovyy Tngrf')
rot13('Gvz Orearef-Yrr')
rot13('Fgrir Jbmavnx')
rot13('Xbaenq Mhfr')
rot13('Fve Nagbal Ubner')
rot13('Zneiva Zvafxl')
rot13('Lhxvuveb Zngfhzbgb')
rot13('Unllvz Fybavzfxv')
rot13('Tregehqr Oynapu')
