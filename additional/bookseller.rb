=begin
*assignment*
Help the bookseller!

A bookseller has lots of books classified in 26 categories labeled A, B, ... Z.
Each book has a code c of 3, 4, 5 or more capitals letters. The 1st letter of a
code is the capital letter of the book category. In the bookseller's stocklist
each code c is followed by a space and by a positive integer n (int n >= 0)
which indicates the quantity of books of this code in stock.

For example an extract of one of the stocklists could be:

L = {"ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"}.
or
L = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]

You will be given a stocklist (e.g. : L) and a list of categories in capital
letters e.g :

M = {"A", "B", "C", "W"}
or
M = ["A", "B", "C", "W"]

and your task is to find all the books of L with codes belonging to each
category of M and to sum their quantity according to each category.

For the lists L and M of example you have to return the string
(in Haskell/Clojure a list of pairs):
(A : 20) - (B : 114) - (C : 50) - (W : 0)
where A, B, C, W are the categories, 20 is the sum of the unique book of
category A, 114 the sum corresponding to "BKWRK" and "BTSQZ", 50 corresponding
to "CDXEF" and 0 to category 'W' since there are no code beginning with W.

If L or M are empty return string is ""
(Clojure should return an empty array instead).

Note:
In the result codes and their values are in the same order as in M.


*problem*
input: two data collections (hashes or arrays) each containing strings
output: string containing letters contained within second collection : sum of
all items with that character as its first character in the first collection


*examples / test cases *
b = ["ABAR 200", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"]
c = ["A", "B"]
res = "(A : 200) - (B : 1140)"
stockList(b, c) == res

*data structures*
array of strings, hash, string

*algorithm*
BEGIN
SET res = ""
SET totals = {}
  WHILE there are elements remaining in collection 2
    SET each element to a key of the hash = 0
    WHILE there are elements remaining in collection 1
      IF the first character of the element == current element of collection 2
        SET book_count = split the element at the white space
        SET totals[element_col2] += book_count[1]

    WHILE elements remain in totals, iterate over it
      res += "(#{key} : totals[#{key}])"
    res.gsub(')(', ') - (')
    PRINT res
END
=end

def stockList(listOfArt, listOfCat)
  res = ''
  if listOfArt.empty?
    return res
  else
    totals = {}

    listOfCat.each do |code|
      totals[code] = 0
      listOfArt.each do |inventory|
        if inventory[0] == code
          book_count = inventory.split
          totals[code] += book_count[1].to_i
        end
      end
    end

    totals.each_pair do |code, books|
      res += "(#{code} : #{books})"
    end

    res.gsub!(')(', ') - (')
  end
  res
end

b = ["ABAR 200", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"]
c = ["A", "B"]
res = "(A : 200) - (B : 1140)"
p stockList(b, c) == res


b = []
c = ["A", "B"]
res = ""
p stockList(b, c) == res
