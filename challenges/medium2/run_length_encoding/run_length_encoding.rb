class RunLengthEncoding
  def self.encode(string)
    holding = string.chars.each_with_object([]) do |character, holding|
      if holding.empty? || character != holding.last[1]
        holding << [1, character]
      else
        holding.last[0] += 1
      end
    end
    holding.flatten.select { |value| value != 1 }.map(&:to_s).join
  end

  def self.decode(string)
    array = string.scan(/(\d+)?(.)/)
    array = array.map do |values|
      values[0].nil? ? values[1] : values[1] * values[0].to_i
    end
    array.flatten.join
  end
end
