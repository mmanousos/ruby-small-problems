# Files
# You started writing a very basic class for handling files. However, when you
# begin to write some simple test code, you get a NameError. The error message
# complains of an uninitialized constant File::FORMAT.
#
# What is the problem and what are possible ways to fix it?

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

# By adding `self` as the object for which `FORMAT` is referenced in the `to_s`
# method, our first two puts calls return `true`. However the final puts call
# does not. I'm not sure what the `bytes` method on `line 38` does (I don't
# see it defined anywhere) and I wonder if this has something to do with it.

# bytes has nothing to do with it. We need to clarify that we need to access the
# class of the calling object in order to reference the contained constant.
# => self.class::FORMAT

# Further Exploration
# If you aren't familiar with Module#alias_method, take a moment to view Ruby's
# documentation. You don't need to memorize this method, but get in the habit
# of referring to documentation when you see code you aren't familiar with.

# String#bytes is a built-in Ruby method so it did not necesitate definition in
# our program. From what I can glean by reading the documentation and various
# web entries, this is to convert characters into bytes for consistent display
# regardless of font and screen.

# Module#alias_method can be used to create shortcuts or aliases for previously
# defined methods - especially useful for methods that may be overwritten.
