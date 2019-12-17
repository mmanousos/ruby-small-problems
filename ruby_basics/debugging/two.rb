# 2. Weather Forecast
# Our predict_weather method should output a message indicating whether a sunny or cloudy day lies ahead. However, the output is the same every time the method is invoked. Why? Fix the code so that it behaves as expected.

=begin
def predict_weather
	sunshine = ['true', 'false'].sample

	if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather
=end

# guess: the #sample method needs to be called defining "sunshine" outside of the method. INCORRECT
# further reasoning: variables, including strings, always evaluate to true. so without evaluating the assignment of 'sunshine', the conditional always would evaluate the true branch.

def predict_weather
	sunshine = ['true', 'false'].sample

	if sunshine == 'true' # by giving conditional a value something to check against, it can evaluate the alternatives
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather
