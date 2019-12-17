# separate methods for each part
# class PerfectNumber
#   def self.classify(integer)
#     raise RuntimeError if integer < 1
#     total = [*1..number-1].select { |value| (number % value).zero? }.sum
#
#     case
#     when total > integer  then 'abundant'
#     when total < integer  then 'deficient'
#     else                       'perfect'
#     end
#   end
#
#   def self.factors_sum(number)
#     determine_factors(number).sum
#   end
#
#   def self.determine_factors(number)
#     [*1..number-1].select { |value| (number % value).zero? }
#   end
# end
#
# # combined solution
# class PerfectNumber
#   def self.classify(integer)
#     raise RuntimeError if integer < 1
#     total = [*1..integer-1].select { |value| (integer % value).zero? }.sum
#
#     case
#     when total > integer  then 'abundant'
#     when total < integer  then 'deficient'
#     else                       'perfect'
#     end
#   end
# end

# even more simplified solution using <=> (based on another student's solution)
class PerfectNumber
  def self.classify(integer)
    raise RuntimeError if integer < 1
    total = [*1..integer-1].select { |value| (integer % value).zero? }.sum

    case total <=> integer
    when 1  then 'abundant'
    when -1 then 'deficient'
    else         'perfect'
    end
  end
end
