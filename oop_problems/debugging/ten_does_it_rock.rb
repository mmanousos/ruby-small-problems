# Does it Rock or Not?
# We discovered Gary Bernhardt's repository for finding out whether something
# rocks or not, and decided to adapt it for a simple example.

# class AuthenticationError < Exception; end
class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end


module DoesItRock
  API_KEY = 'LS1A'
# API_KEY = '0000'

  class NoScore; end

  class Score
    def self.for_term(term)
      # positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      # negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)
      # need divisor not to be a float in order to trigger ZeroDivisionError
      # exception, when necessary so only convert it to a float when dividing

      positive.to_f / (positive + negative)
      # positive.fdiv(positive + negative)

    # rescue Exception
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end

  # rescue Exception => e
  rescue AuthenticationError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!
#
# In order to test the case when authentication fails, we can simply set API_KEY
# to any string other than the correct key. Now, when using a wrong API key,
# we want our mock search engine to raise an AuthenticationError, and we want
# the find_out method to catch this error and print its error message API key is
# not valid.
#
# Is this what you expect to happen given the code?
#
# And why do we always get the following output instead?
#
# Sushi rocks!
# Rain rocks!
# Bug hunting rocks!


# DoesItRock is a module, not a class. Should we be calling methods on a module?
# Maybe the module is only being used to create a namespace?
# It appears that no error is being thrown for the changed `API_KEY` constant
# and the results of the three `puts` calls are always `rocks!` because the
# `SearchEngine` class is not operating as expected so no `score` is being
# assigned to any of the terms.

# In order for the key validation to execute, we need to make sure the method is
# scoped properly. To achieve this, we can change the `private` to `protected`
# and use the `self.valid?` method as written.
# But this still does not generate the error message as expected when the
# API_KEY constant does not match.
