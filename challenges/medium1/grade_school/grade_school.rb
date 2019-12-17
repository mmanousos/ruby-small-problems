class School
  attr_accessor :school

  def initialize
    @school = {}
  end

  def add(name, grade)
    school[grade] ? school[grade].push(name).sort! : school[grade] = [name]
  end

  def grade(level)
    school[level] || []
  end

  def to_h
    school.sort.to_h
  end
end
