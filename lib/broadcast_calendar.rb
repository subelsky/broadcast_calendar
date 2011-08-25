require "date"

module BroadcastCalendar
  extend self

  def dates_for(month,year)
    # find the monday of the first week of the month
    beginning = Date.civil(year,month,1)

    if (wday = beginning.wday) == 0
      beginning -= 6
    else
      beginning -= wday - 1
    end
    
    ending = Date.civil(year,month,-1)
    ending -= ending.wday # broadcast calendar always ends on Sunday

    beginning..ending
  end

  def weeks_for(month,year)
    dates_for(month,year).each_slice(7).collect { |s| s.first..s.last }
  end

  def month_and_year_for(date)
    range = dates_for(date.month,date.year)

    month = date.month
    year = date.year

    unless range.cover?(date)
      month += (date <=> range.begin)
      if month < 1
        month = 12
        year -= 1
      elsif month > 12
        month = 1
        year += 1
      end
    end

    [month,year]
  end
end
