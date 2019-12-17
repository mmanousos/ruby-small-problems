=begin
Good luck Coop(updated)!
https://www.codewars.com/kata/good-luck-coop-updated
Your aim in this puzzle will be to help agent Cooper to avoid the evil powers.

How can you help?

You, as agent Gordon, can see the board and you have directions from FBI and
directions from FBI are always safest. What you can do is to check the board for
agent Coop and text him the only safe route he has to take.

** Cooper can take only horizontal or vertical gate.
** Gates numbering starts from one.

look at the actual example:
If your directions from FBI is "abcdd" and your board is:
game = [["abcdd"], ["12345"], ["ratca"], ["pimmu"], ["rest1"]]
   "abcdd",            a b c d d
   "12345",            1 2 3 4 5
   "ratca",     =>     r a t c a
   "pimmu",            p i m m u
   "rest1"             r e s t 1

it is obvious that you have to send a massage to Coop that says: "Horizontal 1",
so he can take the safe route.
another example: if we have the same board and your direction is "c3tms" your
message has to be "Vertical 3!" because it matches 3rd vertical line;
If the directions are too short or too long or do not match any horizontal or
vertical line you have to text agent Cooper: "Coop, it's too risky!".

** Board is always square and length of the direction might not match the length
of the square
** Password and board subarrays are always provided as lowerCase strings
** Function has to return a string

*problem*
input: string
output: string "Vertical " or "Horizontal " + index + 1 or "Coop, it's too risky!"

*examples / test cases *
board = [["abcdd"], ["12345"], ["ratca"], ["pimmu"], ["rest1"]]
coop('abcdd', board) == 'Horizontal 1'
coop('abcdde', board) == "Coop, it's too risky!"
coop('c3tms', board) == 'Vertical 3'
coop('c3tm', board) == "Coop, it's too risky!"
coop('zbadc', board) == "Coop, it's too risky!"

*data structures*
string & 2D array of strings

*algorithm*
BEGIN
  declare a method that accepts one string (password) and one 2D array of strings (board) as arguments
    IF length of password is != length board
      PRINT "Coop, it's too risky!"
    ELSE
      WHILE counter < board.size
        check if each string contained in the row matches password
        IF row string == password
          PRINT "Horizontal " + index + 1
        end
      end

      SET counter = 0
      WHILE counter < board.size
        SET column = ''
        check if vertical (columns) match password
          access the character in each counter index place of every subarray
          add it to the column string
          IF column == password
            PRINT "Verical " + counter + 1
          end
        end
    end
    PRINT "Coop, it's too risky!"
END
=end

def coop(password, board)
  if password.size != board.size
    return "Coop, it's too risky!"
  else
    board.each_with_index do |row, idx|
      row.each do |str|
        if str == password
          return "Horizontal #{idx + 1}"
        end
      end
    end
  end

  counter_columns = 0
  while counter_columns < board.size
    column = ''
    board.each do |row|
        row.each do |str|
          column << str[counter_columns]
          return "Vertical #{counter_columns + 1}" if column == password
        end
      end
    counter_columns += 1
  end

  return "Coop, it's too risky!"
end


game = [["abcdd"], ["12345"], ["ratca"], ["pimmu"], ["rest1"]]
p coop('ratca', game) == 'Horizontal 3'
p coop('abcdde', game) == "Coop, it's too risky!"
p coop('c3tms', game) == 'Vertical 3'
p coop('a1rpr', game) == 'Vertical 1'
p coop('b2aie', game) == 'Vertical 2'
p coop('b2aez', game) == "Coop, it's too risky!"
p coop('c3tm', game) == "Coop, it's too risky!"
p coop('zbadc', game) == "Coop, it's too risky!"
