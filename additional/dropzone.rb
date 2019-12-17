=begin
*assignment*
Dropzone

A forest fire has been spotted at fire, a simple 2 element array with x, y
coordinates.

The forest service has decided to send smoke jumpers in by plane and drop them
in the forest.

The terrain is dangerous and surveyors have determined that there are three
possible safe dropzones, an array of three simple arrays with x, y coordinates.

The plane is en route and time is of the essence. Your mission is to return a
simple [x,y] array with the coordinates of the dropzone closest to the fire.


*problem*
input: fire at x,y cooredinates in array & 3 possible drop points in second nested array of x,y coordinates
output: x,y array from nested array that is least different from first x,y array


*examples / test cases *
dropzone([6,8], [[3,2],[6,1],[7,9]]) == [7,9]
dropzone([9,2], [[1,4],[9,9],[5,5]]) == [5,5]

*data structures*


*algorithm*
BEGIN
  declare method that takes two arrays as arguments (fire, dropzones)
    SET droppoint = nil
    SET best_x = 0
    SET best_y = 0
    SET diff_x = 0
    SET diff_y = 0
    loop through nested arrays within dropzones to find which is least different from fire.
    dropzones.each_with_index do |coord, idx|
      diff_x = fire[0].abs - coord[0].abs
      diff_y = fire[1].abs - coord[1].abs
      IF diff_x < best_x && diff_y < best_y
        droppoint = dropzones[idx]
      end
    end
    PRINT droppoint
END
=end
def dropzone(fire, dropzones)
  distance = dropzones.map do |coord|
    diff_x = fire[0] - coord[0]
    diff_y = fire[1] - coord[1]
    (diff_x + diff_y).abs
  end
  droppoint = dropzones[distance.index(distance.min)]
end

p dropzone([6,8], [[3,2],[6,1],[7,9]]) == [7,9]
p dropzone([9,2], [[1,4],[9,9],[5,5]])  == [5,5]

=begin
Solution works for the provided examples but not for other tests.
Requires more math to calculate the distance between the two points based on the
coordinates.
=end 
