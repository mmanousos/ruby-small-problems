Run-length Encoding
Implement run-length encoding and decoding.

Run-length encoding (RLE) is a simple form of data compression, where runs (consecutive data elements) are replaced by just one data value and count.

For example we can represent the original 53 characters with only 13.

"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"

RLE allows the original data to be perfectly reconstructed from the compressed data, which makes it a lossless data compression.

"AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"


encode method
in: string with repeating characters
out: string with single instance of each repeated character preceded by a numeric representation of how many of those characters were present in the original string

AL:
iterate through string
create holding array
first element - add 1 to array, and character as second element
second element -
  if character == holding array.last[1]
    increment holding.last[0]
  else
    holding << [1, character]
  end
holding.map
  subarray[1] if subarray[0] == 1
flatten
join  

decode method
in: string with numeric representations of characters preceding characters
out: expanded string with all numbers replaced by that number of characters

AL:
split string on groups of numeric values and characters
str = "12WB12W3B24WB"
str.scan(/(\d+)?(.)/)  
=> [["12", "W"], [nil, "B"], ["12", "W"], ["3", "B"], ["24", "W"], [nil, "B"]]

map the nested array.
if the first element is nil, just return the second element
if values[0].nil?
  values[1]
else
  values[1] * values[0].to_i
end
flatten.join   
