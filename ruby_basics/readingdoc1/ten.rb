# 10. Class and Instance Methods
# Locate the ruby documentation for methods File::path and File#path. How are they different?

File::path = https://ruby-doc.com/core-2.3.3/File.html#method-c-path
The Class method: Applies to any time the method is called on any item in the File Class.
"Returns the string represenation of the path."
Used by calling File.path("pathname")

File#path = https://ruby-doc.com/core-2.3.3/File.html#method-i-path
The Instance method: Applies only to specific objects within the File Class.
"Returns the pathname used to create file as a string. Does not normalize the name."
Used by calling: File.new("pathname").path
