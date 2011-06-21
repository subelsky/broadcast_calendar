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
end
