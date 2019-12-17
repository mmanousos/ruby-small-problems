=begin

Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.

1. (32 * 4) >= 129
2. false != !true
3. true == 4
4. false == (847 == '847')
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false

=end

1. false # 128 is not greater than or equal to 129
2. false # false is not the opposite of not true
3. false # a boolean and an integer are not equal
4. true # the integer 847 does not equal the string '847' so that evaluates to false, which equals false
5. true
=begin
working from inside the parentheses
the opposite of 100/5 returns false so comparing that to 20 gives us false
328 / 4 is 82 so that returns true
!true is false
so comparing false or false or true on the left and false on the right
means this evaluates to true.
=end
