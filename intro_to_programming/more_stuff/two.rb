
# What will the following program print to the screen? What will it return?

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }


=begin - My guess
prints: "Hello from inside the execute method!"
returns: nil
=end

# Actual output of the method
prints: nothing (because the block was never initiated with the '.call' method)
returns: Proc
