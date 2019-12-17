=begin
Exploring Procs, Lambdas, and Blocks: Definition and Arity
This exercise covers material that you do not have to master. We provide the
exercise as a way to explore the differences between procs, lambdas, and blocks.

For this exercise, we'll be learning and practicing our knowledge of the arity
of lambdas, procs, and implicit blocks. Two groups of code also deal with the
definition of a Proc and a Lambda, and the differences between the two. Run each
group of code below: For your answer to this exercise, write down your
observations for each group of code. After writing out those observations, write
one final analysis that explains the differences between procs, blocks, and
lambdas.
=end

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
# my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
my_proc.call('cat', 'dog')

# A proc is an object, so `#puts` calls on it results in the object being
# printed to screen.
# In order to execute a proc successfully, we need to use `#call` and pass in an
# argument. But they will execute without an argument (like blocks).
# Procs are created with the keyword `proc` (interchangeable with `Proc.new`)
# followed by a block.
#
# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
#
# A lambda is a specific type of proc object, as we can see when using a `#puts`
# call because `(lambda)` is appended to the end of the object description.
# They require an argument to execute at all, otherwise an ArgumentError will be
# raised. Therefore lambdas are the most strict version of block formats.
# Lambdas can not be created using Lambda.new, instead they are created with
# the `lambda {}` or `-> () {}` syntax (where the block parameter goes in
# the paretheses instead of inside `||` within the curly braces).
#
# # Group 3
# def block_method_1(animal)
#   yield
# end
#
# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')
#
# Argument must be passed to the block using the `yield` keyword in order for
# the block to access it.
# Methods that have the `yield` keyword must be passed a block or they will
# raise a LocalJumpError.
#
# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end
#
# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}
#
# We can define as many block parameters as we want, but if they are not passed
# in to the `yield` or defined within the block, they will not be processed.
# (Can use the splat operator to indicate that more than one might be passed.)
# Must define block parameters for the block to reference any variables.
#
# Lambdas are restrictive types of Proc objects that require arguments be passed
# to them to be called successfully. Since they are variations of one another,
# both Procs and Lambdas can be executed directly using the `#call` method.
# Procs and lambdas are defined by specifying the keyword when defining the
# block and variable with which they are associated.
# e.g.
#   my_proc = proc { |stuff| puts "#{stuff}" }
#   my_lambda = lambda { |things| puts "#{things}" } or
#   my_other_lambda = -> (more_things) { puts "#{more_things}" }
#
# All versions of blocks (blocks, procs, and lambdas) require that the
# appropriate number of arguments be passed to them via `yield` in order for
# those arguments to be accessible. We can use the splat operator to indicate
# that more than one argument may be passed.
