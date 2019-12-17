# Pet Shelter
# Consider the following code:
#
# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
#
# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')
#
# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# Write the classes and methods that will be necessary to make this code run, and print the following output:
#
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin
#
# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester
#
# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The order of the output does not matter, so long as all of the information is presented.


In my original solution, the Shelter keeps track of both the owners and the
pets (because, in reality, they would need to track this information). And
that seemed to be the way the problem was laid out based on the
shelter.print_adoptions method call
class Shelter

  @@adoptions = {}

  def adopt(owner, pet)
    if @@adoptions.has_key?(owner)
      @@adoptions[owner] << pet
      owner.add_pet
    else
      @@adoptions[owner] = [pet]
      owner.add_pet
    end
  end

  def print_adoptions
    @@adoptions.each_key do |owner|
      puts "#{owner} has adopted the following pets:"
      @@adoptions[owner].each do |pets|
        puts "• a #{pets.type} named #{pets.name}"
      end
    end
  end
end

class Owner
  attr_reader :name, :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def to_s
    @name
  end

  def add_pet
    @number_of_pets += 1
  end

  def number_of_pets
    @number_of_pets
  end
end

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end
#
# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
#
# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')
#
# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# # P Hanson has adopted the following pets:
# # a cat named Butterscotch
# # a cat named Pudding
# # a bearded dragon named Darwin
# # B Holmes has adopted the following pets:
# # a dog named Molly
# # a parakeet named Sweetie Pie
# # a dog named Kennedy
# # a fish named Chester
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# # P Hanson has 3 adopted pets.
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# # B Holmes has 4 adopted pets.

# Alternate solution - pets are contained within the owner objects then
# shared with the Shelter object as Collaborator objects.
# Closer to real world - Owner owns Pets once adopted, but the Shelter keeps a
# record too
# class Pet
#   attr_reader :type, :name
#
#   def initialize(type, name)
#     @type = type
#     @name = name
#   end
#
#   def to_s
#     "a #{type} named #{name}"
#   end
# end
#
# class Owner
#   attr_reader :name, :pets
#
#   def initialize(name)
#     @name = name
#     @pets = []
#   end
#
#   def add_pet(pet)
#     @pets << pet
#   end
#
#   def number_of_pets
#     @pets.size
#   end
#
#   def print_pets
#     @pets.each { |pet| puts pet }
#   end
# end
#
# class Shelter
#   def initialize
#     @adoptions = {}
#   end
#
#   def adopt(owner, pet)
#     owner.add_pet(pet)
#     @adoptions[owner.name] ||= owner
#   end
#
#   def print_adoptions
#     @adoptions.each_pair do |name, owner|
#       puts "#{name} has adopted the following pets:"
#       owner.print_pets
#     end
#   end
# end
#
# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
#
# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')
#
# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# p shelter
# shelter.print_adoptions
# # P Hanson has adopted the following pets:
# # a cat named Butterscotch
# # a cat named Pudding
# # a bearded dragon named Darwin
# # B Holmes has adopted the following pets:
# # a dog named Molly
# # a parakeet named Sweetie Pie
# # a dog named Kennedy
# # a fish named Chester
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# # P Hanson has 3 adopted pets.
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# # B Holmes has 4 adopted pets.


# Further Exploration
# Suppose the shelter has a number of not-yet-adopted pets, and wants to manage
# them through this same system. Thus, you should be able to add the following
# output to the example output shown above:

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...
#
# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.
# Can you make these updates to your solution? Did you need to change your
# class system at all? Were you able to make all of your changes without
# modifying the existing interface?

class Shelter

  @@adoptions = {}

  def adopt(owner, pet)
    if @@adoptions.has_key?(owner)
      @@adoptions[owner] << pet
      owner.add_pet
    else
      @@adoptions[owner] = [pet]
      owner.add_pet
    end
  end

  def print_adoptions
    @@adoptions.each_key do |owner|
      if owner.name != 'Animal Shelter'
        puts "#{owner} has adopted the following pets:"
      else
        puts "#{owner} has the following unadopted pets:"
      end
      @@adoptions[owner].each do |pet|
        puts "• a #{pet.type} named #{pet.name}"
      end
    end
  end
end

class Owner
  attr_reader :name, :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def to_s
    @name
  end

  def add_pet
    @number_of_pets += 1
  end

  def number_of_pets
    @number_of_pets
  end
end

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

shelter = Shelter.new
available = Owner.new('Animal Shelter')

asta        = Pet.new('dog', 'Asta')
laddie      = Pet.new('dog', 'Laddie')
fluffy      = Pet.new('cat', 'Fluffy')
kat         = Pet.new('cat', 'Kat')
ben         = Pet.new('cat', 'Ben')
chatterbox  = Pet.new('parakeet', 'Chatterbox')
bluebell    = Pet.new('parakeet', 'Bluebell')

shelter.adopt(available, asta)
shelter.adopt(available, laddie)
shelter.adopt(available, fluffy)
shelter.adopt(available, kat)
shelter.adopt(available, ben)
shelter.adopt(available, chatterbox)
shelter.adopt(available, bluebell)
shelter.print_adoptions

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
