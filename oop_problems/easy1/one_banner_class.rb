# Banner Class
# Behold this incomplete class for constructing boxed banners.
#
# class Banner
#   def initialize(message)
#   end
#
#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end
#
#   private
#
#   def horizontal_rule
#   end
#
#   def empty_line
#   end
#
#   def message_line
#     "| #{@message} |"
#   end
# end
# Complete this class so that the test cases shown below work as intended. You
# are free to add any methods or instance variables you need. However, do not
# make the implementation details public.
#
# You may assume that the input will always fit in your terminal window.
#
# Test Cases
#
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+


# class Banner
#   def initialize(message)
#     @message = message
#   end
#
#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end
#
#   private
#
#   def horizontal_rule
#     "+-#{'-' * @message.size}-+"
#   end
#
#   def empty_line
#     "| #{' ' * @message.size} |"
#   end
#
#   def message_line
#     "| #{@message} |"
#   end
# end
#
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+
# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
# Modify this class so new will optionally let you specify a fixed banner width
# at the time the Banner object is created. The message in the banner should be
# centered within the banner of that width. Decide for yourself how you want to
# handle widths that are either too narrow or too wide.

class Banner
  def initialize(message, width=false)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def calculate_banner_padding
    if @width < @message.size
      banner_padding
    else
      @width
    end
  end

  def message_padding
    (@width - @message.size) / 2
  end

  def calculate_message_padding
    if @message.size < @width
      message_padding
    elsif @message.size == @width
      0
    else
      1
    end
  end

  def banner_padding
    @message.size + 2
  end

  def horizontal_rule
    @width = calculate_banner_padding
    "+-#{'-' * (@width)}-+"
  end

  def empty_line
    @width = calculate_banner_padding
    "| #{' ' * (@width)} |"
  end

  def message_line
    padding = calculate_message_padding
    "| #{' ' * padding}#{@message}#{' ' * padding} |"
  end
end
#
banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner

banner = Banner.new('To', 2)
puts banner
#
banner = Banner.new('before.', 2)
puts banner

banner = Banner.new('happy feet.', 1)
puts banner

banner = Banner.new('happy feet.', 67)
puts banner

https://launchschool.com/exercises/de341977
