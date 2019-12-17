class BeerSong
  def verses(value, bound)
    @value = value
    @bound = bound -1
    results = []

    while @value > @bound
      @lower_value = @value - 1
      @verse = "#{check_number(@value).to_s.capitalize} #{check_bottle(@value)} of beer on the wall, #{check_number(@value)} #{check_bottle(@value)} of beer.\n" \
        "#{check_condition(@value)}, #{check_number(@lower_value)} #{check_bottle(@lower_value)} of beer on the wall.\n"
      results << @verse
      @value = @lower_value
    end

    results.join("\n")
  end

  def verse(value)
    verses(value, value)
  end

  def lyrics
    verses(99, 0)
  end

  def check_number(value)
    case value
    when 0  then 'no more'
    when -1 then 99
    else         value
    end
  end

  def check_condition(number)
    case number
    when 0 then 'Go to the store and buy some more'
    when 1 then 'Take it down and pass it around'
    else        'Take one down and pass it around'
    end
  end

  def check_bottle(number)
    number == 1 ? 'bottle' : 'bottles'
  end
end
