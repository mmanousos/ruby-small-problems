# Stack Machine Interpretation
# This is one of the hardest exercises in this exercise set. It uses both
# exceptions and Object#send, neither of which we've discussed in detail before
# now. Think of this exercise as one that pushes you to learn new things on your
# own, and don't worry if you can't solve it.
#
# You may remember our Minilang language from back in the 101 Medium exercises.
# We return to that language now, but this time we'll be using OOP. If you need
# a refresher, refer back to that exercise.
#
# Write a class that implements a miniature stack-and-register-based programming
# language that has the following commands:
#
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the
# result in the register.
# SUB Pops a value from the stack and subtracts it from the register value,
# storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value,
# storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value,
# storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value,
# storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and
# MOD).
#
# Programs will be supplied to your language method via a string passed in as
# an argument. Your program should produce an error if an unexpected item is
# present in the string, or if a required stack value is not on the stack when
# it should be (the stack is empty). In all error cases, no further processing
# should be performed on the program.
#
# You should initialize the register to 0.

# Examples:

class MinilangRuntimeError < RuntimeError; end
class BadOrderError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(command)
    @register = 0
    @stack = []
    @command = command
  end

  def eval
    @command.split.each { |order| eval_order(order) }
  rescue MinilangRuntimeError => error
    puts error.message
  end

  def eval_order(order)
    if COMMANDS.include?(order)
      send(order.downcase) # this single command replaces an entire case statement!
    elsif order.to_i != 0
      @register = order.to_i
    else
      raise BadOrderError, "Invalid token: #{order}"
    end
  end

  def push
    @stack << @register
  end

  def add
    @register += (@stack.pop)
  end

  def subtr
    @register -= (@stack.pop)
  end

  def mult
    @register *= (@stack.pop)
  end

  def div
    @register /= (@stack.pop)
  end

  def mod
    @register %= (@stack.pop)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts "#{@register}"
  end
end


Minilang.new('PRINT').eval
# 0
Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5
Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB
Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8
Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)


Further Exploration
You can write minilang programs that take input values by simply interpolating
values into the program string with Kernel#format.
For instance,

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 100)).eval
# 212
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 0)).eval
# 32
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: -40)).eval
# -40
This process could be simplified by passing some optional parameters to eval,
and using those parameters to modify the program string.

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40
Try to implement this modification. Also, try writing other minilang programs,
such as one that converts fahrenheit to centigrade, another that converts
miles per hour to kilometers per hour (3 mph is approximately equal to 5 kph).
Try writing a program that needs two inputs: for example, compute the area of
a rectangle.
