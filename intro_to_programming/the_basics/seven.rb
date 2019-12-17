=begin
What does the following error message tell you?
	SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
  	from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
=end

Indicates that there is typo where a closed parens was included instead of a closed curly brace (and therefore an unclosed declaration within).
The error possibly occurs on the second line of the irb commands. 
