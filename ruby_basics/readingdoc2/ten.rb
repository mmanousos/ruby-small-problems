# 10. Down the Rabbit Hole
=begin
Sometimes, the documentation is going to leave you scratching your head.

In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages from a YAML file. We do this with YAML::load_file:

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
Find the documentation for YAML::load_file.
=end

First I searched in search bar -> looked in https://ruby-doc.org/stdlib-1.9.3/libdoc/yaml/rdoc/YAML/Store.html,
then in https://ruby-doc.org/stdlib-2.5.0/libdoc/yaml/rdoc/YAML/Store.html
Remembering the Chris Pine book, I recalled that we mostly used YAML with File methods, so I searched under Class: File
Then I checked under Class: IO.
Failing that, I used the search bar again to search 'load_file'. Many listings of the Module: Psych documentation came up.
So I navigated to the latest (2.5.1) and sure enough, it had a method of 'load_file'.

https://ruby-doc.com/stdlib/libdoc/psych/rdoc/Psych.html#method-c-load_file
'Load the document contained in filename. Returns the yaml contained in filename as a Ruby object, or if the file is empty, it returns the specified default return value, which defaults to an empty Hash'
