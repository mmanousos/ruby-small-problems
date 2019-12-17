class WordProblem
  attr_reader :problem

  OPERATORS = { 'plus' => '+',
                'minus' => '-',
                'multiplied by' => '*',
                'divided by' => '/' }

  def initialize(problem)
    raise ArgumentError if valid_problem?(problem)
    @problem = parse_values_and_operators(problem)
  end

  def answer
    argument_arr = problem
    until argument_arr.size == 3
      front = argument_arr.shift(3)
      argument_arr.unshift(evaluate_array(front).to_s)
    end
    evaluate_array(argument_arr)
  end

  private

  def evaluate_array(arr)
    eval(arr.join)
  end

  def parse_values_and_operators(string)
    string.scan(/-?\d+|#{OPERATORS.keys.join('|')}/)
          .map { |value| value =~ /\d+/ ? value : OPERATORS[value] }
  end

  def valid_problem?(problem)
    OPERATORS.keys.none? { |key| problem =~ /#{key}/ } ||
      (problem =~ /\d/).nil?
  end
end
