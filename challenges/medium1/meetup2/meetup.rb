require 'Date'

class Meetup
  DAYS_OF_WEEK = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday,
                  :sunday].freeze
  DAYS_OF_MONTH = { first: 0,
                    second: 1,
                    third: 2,
                    fourth: 3,
                    last: -1 }.freeze

  def initialize(month, year)
    @month = month
    @meetup_date = Date.new(year, @month)
  end

  def day(weekday, week)
    first = firstday(@meetup_date, weekday)
    find_week(week, array_of_weekdays(first))
  end

  def firstday(date, weekday)
    value = 0
    while value <= 7
      break if match_weekday?(date, weekday)
      date += 1
      value += 1
    end
    @meetup_date = date
  end

  def match_weekday?(date, weekday)
    date.send(weekday.to_s + '?')
  end

  def array_of_weekdays(date)
    weekdays = [date]
    until date.month != @month
      date += 7
      weekdays << date if date.month == @month
    end
    weekdays
  end

  def find_week(week, weekdays_array)
    case week
    when :teenth
      weekdays_array.detect { |date| teenth?(date) }
    else
      weekdays_array[DAYS_OF_MONTH[week]]
    end
  end

  def teenth?(date)
    day_of_month = date.day
    day_of_month < 20 && day_of_month > 12
  end
end
