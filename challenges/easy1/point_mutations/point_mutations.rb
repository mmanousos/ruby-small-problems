class DNA
  def initialize(strand)
    @strand1 = strand
  end

  def hamming_distance(strand2)
    max_length = calculate_max_length(strand1, strand2)
    chars1 = strand1.chars
    counter = 0
    chars1.each_with_index do |char, idx|
      break if idx > max_length - 1
      counter += 1 if char != strand2[idx]
    end
    counter
  end

  private

  attr_accessor :strand1

  def check_length(strand1_size, strand2_size)
    strand1_size <=> strand2_size
  end

  def calculate_max_length(strand1, strand2)
    size1 = strand1.length
    size2 = strand2.length
    check_length(size1, size2) == -1 ? size1 : size2
  end
end

# Course Solution 1
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_2)
    strand_1 = @strand[0, strand_2.length]
    strand_1.chars.zip(strand_2.chars).count { |pair| pair.first != pair.last }
  end
end

# really clever use of #zip to pair the items
# I appreciate that then they could use #count -
# I thought to originally but it didn't work with the direction I took.
# seems this technique works as long as you make the two strings the same length

# Course Solution 2
class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    distance = 0
    min, max = [@strand1, strand2].sort_by(&:size)
    min.each_char.with_index do |char, index|
      distance += 1 unless char == max[index]
    end
    distance
  end
end

# clever use of sort_by to determine which was smaller then iterate over that
# one only - avoids the need to remove any characters.
