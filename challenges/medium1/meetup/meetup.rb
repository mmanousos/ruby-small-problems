require 'date'

class Meetup
  DATES = [*1..31]
  TEENS = (13..19)

  def initialize(month, year)
    @month = month
    @year = year
    @possible_days = all_dates
  end

  def day(weekday, schedule)
    possible_days = @possible_days.select(&weekday_to_method(weekday))
    when_in_month(schedule, possible_days)
  end

  private
  def weekday_to_method(weekday)
    ((weekday.to_s) + '?').to_sym
  end

  def all_dates
    dates = DATES.map do |date|
      begin
        Date.new(@year, @month, date)
      rescue
        ArgumentError
      end
    end
    dates.delete(ArgumentError) if dates.include?(ArgumentError)
    dates
  end

  def when_in_month(schedule, possible_days)
    case schedule
    when :teenth
      find_teenth(possible_days)
    when :first
      possible_days.first
    when :last
      possible_days.last
    when :second
      possible_days[1]
    when :third
      possible_days[2]
    when :fourth
      possible_days[3]
    end
  end

  def find_teenth(possible_days)
    possible_days.detect { |date| return date if TEENS.cover?(date.day) }
  end
end
