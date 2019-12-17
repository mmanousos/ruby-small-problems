class Clock
  def self.at(hour, minutes=0)
    Clock.new(hour, minutes)
  end

  def to_s
    format('%02d:%02d', hour, minutes)
  end

  def +(extra_minutes)
    new_minutes = minutes + extra_minutes
    while new_minutes >= 60
      self.hour += 1
      new_minutes -= 60
    end
    self.hour -= 24 if after_midnight?
    self.minutes = new_minutes
    Clock.at(self.hour, minutes)
  end

  def -(fewer_minutes)
    new_minutes = minutes - fewer_minutes
    while new_minutes < 0
      self.hour -= 1
      new_minutes += 60
    end
    self.hour += 24 if before_midnight?
    self.minutes = new_minutes
    Clock.at(self.hour, minutes)
  end

  def ==(second_clock)
    hour == second_clock.hour && minutes == second_clock.minutes
  end

  protected

  attr_accessor :hour, :minutes

  private

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def after_midnight?
    self.hour >= 24
  end

  def before_midnight?
    self.hour < 0
  end
end
