# Comparing Wallets
# Consider the following broken code:
#
# class Wallet
#   include Comparable
#
#   def initialize(amount)
#     @amount = amount
#   end
#
#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end
# end
#
# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end
# Modify this code so it works. Do not make the amount in the wallet
# accessible to any method that isn't part of the Wallet class.

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    @amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# Further Exploration
# This example is rather contrived and unrealistic, but this type of
# situation occurs frequently in applications. Can you think of any
# applications where protected methods would be desirable?

Any application that deals with passwords and password verification would likely
benefit from using protected methods because the program would want to verify
the password but not make them accessible outside of the object.
