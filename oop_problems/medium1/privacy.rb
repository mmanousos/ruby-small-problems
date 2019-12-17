# Privacy
# Consider the following class:
#
# class Machine
#   attr_writer :switch
#
#   def start
#     self.flip_switch(:on)
#   end
#
#   def stop
#     self.flip_switch(:off)
#   end
#
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end
# Modify this class so both flip_switch and the setter method switch= are
# private methods.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

Moving the attr_writer and `flip_switch` methods below the keyword `private`
makes them both private and thus only accessible within the object.
Then the calls to `flip_switch` need to have the `self.` prefix removed in
order to successfully call from the newly private method. They are unnecessary
when the method was public anyway.
#
# Further Exploration
# Add a private getter for @switch to the Machine class, and add a method to
# Machine that shows how to use that getter.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def status
    "The machine is currently turned #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# Changing attr_writer to attr_accessor adds a private getter method.
# Adding a public `status` method allows us to interpolate the state of `switch`
# into an output string to learn if the machine is on or off.

washer = Machine.new
washer.start
puts washer.status
washer.stop
puts washer.status
