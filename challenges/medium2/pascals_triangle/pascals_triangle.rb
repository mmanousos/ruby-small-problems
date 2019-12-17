class Triangle
  attr_reader :number_of_rows

  def initialize(integer)
    @number_of_rows = integer
    @rows = [[1]]
  end

  def rows
    (number_of_rows - 1).times { @rows << next_row_from(@rows.last) }
    @rows
  end

  private

  def next_row_from(current_row)
    row = [1]
    current_row.each_cons(2) { |value1, value2| row << value1 + value2 }
    row << 1
  end
end
