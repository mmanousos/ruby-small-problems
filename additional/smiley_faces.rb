=begin
*assignment*
Count the smiley faces!

Given an array (arr) as an argument complete the function countSmileys that
should return the total number of smiling faces.

Rules for a smiling face:
-Each smiley face must contain a valid pair of eyes.
Eyes can be marked as : or ;
-A smiley face can have a nose but it does not have to. Valid characters for a
nose are - or ~
-Every smiling face must have a smiling mouth that should be marked with either
) or D.
No additional characters are allowed except for those mentioned.

Valid smiley face examples:
:) :D ;-D :~)
Invalid smiley faces:
;( :> :} :]

Note: In case of an empty array return 0. You will not be tested with invalid
input (input will always be an array). Order of the face (eyes, nose, mouth)
elements will always be the same

*problem*
input: array with strings as elements containing 2-3 characters each
output: integer representing the number of valid "smiley faces" those string
elements represent

empty arrays are an option for input.
but safe to assume input will always be an array.
order of the characters will always be the same.

*examples / test cases *
count_smileys([':)', ';(', ';}', ':-D']);       // should return 2;
count_smileys([';D', ':-(', ':-)', ';~)']);     // should return 3;
count_smileys([';]', ':[', ';*', ':$', ';-D']); // should return 1;

*data structures*
arrays

*algorithm*
BEGIN
  declare a method that accepts one array (arr) as an argument
    SET counter = 0
    check each string element to see if it contains the appropriate characters in the right place.
    if so, increment the counter
    PRINT counter
END
=end

EYES = %w(: ;)
NOSE = %w(- ~)
MOUTH = %w(\) D)

def count_smileys(arr)
  counter = 0
  arr.each do |face|
    if face.size == 3
      if EYES.include?(face[0]) && NOSE.include?(face[1]) && MOUTH.include?(face[2])
        counter += 1
      end
    elsif face.size == 2
      if EYES.include?(face[0]) && MOUTH.include?(face[1])
        counter += 1
      end
    end
  end
  counter
end


p count_smileys([':)', ';(', ';}', ':-D']) == 2;
p count_smileys([';D', ':-(', ':-)', ';~)']) == 3;
p count_smileys([';]', ':[', ';*', ':$', ';-D']) == 1;
