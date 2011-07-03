require 'broadcast_calendar'

describe BroadcastCalendar do
  let(:dates) {
    { 2010 =>
      { 1 => Date.new(2009,12,28)..Date.new(2010,1,31),
        2 => Date.new(2010,2,1)..Date.new(2010,2,28),
        3 => Date.new(2010,3,1)..Date.new(2010,3,28),
        4 => Date.new(2010,3,29)..Date.new(2010,4,25),
        5 => Date.new(2010,4,26)..Date.new(2010,5,30),
        6 => Date.new(2010,5,31)..Date.new(2010,6,27),
        7 => Date.new(2010,6,28)..Date.new(2010,7,25),
        8 => Date.new(2010,7,26)..Date.new(2010,8,29),
        9 => Date.new(2010,8,30)..Date.new(2010,9,26),
      10 => Date.new(2010,9,27)..Date.new(2010,10,31),
      11 => Date.new(2010,11,1)..Date.new(2010,11,28),
      12 => Date.new(2010,11,29)..Date.new(2010,12,26) },

      2011 => 
      { 1 => Date.new(2010,12,27)..Date.new(2011,1,30),
        2 => Date.new(2011,1,31)..Date.new(2011,2,27),
        3 => Date.new(2011,2,28)..Date.new(2011,3,27),
        4 => Date.new(2011,3,28)..Date.new(2011,4,24),
        5 => Date.new(2011,4,25)..Date.new(2011,5,29),
        6 => Date.new(2011,5,30)..Date.new(2011,6,26),
        7 => Date.new(2011,6,27)..Date.new(2011,7,31),
        8 => Date.new(2011,8,1)..Date.new(2011,8,28),
        9 => Date.new(2011,8,29)..Date.new(2011,9,25),
      10 => Date.new(2011,9,26)..Date.new(2011,10,30),
      11 => Date.new(2011,10,31)..Date.new(2011,11,27),
      12 => Date.new(2011,11,28)..Date.new(2011,12,25) },

      2012 =>
      { 1 => Date.new(2011,12,26)..Date.new(2012,1,29),
        2 => Date.new(2012,1,30)..Date.new(2012,2,26),
        3 => Date.new(2012,2,27)..Date.new(2012,3,25),
        4 => Date.new(2012,3,26)..Date.new(2012,4,29),
        5 => Date.new(2012,4,30)..Date.new(2012,5,27),
        6 => Date.new(2012,5,28)..Date.new(2012,6,24),
        7 => Date.new(2012,6,25)..Date.new(2012,7,29),
        8 => Date.new(2012,7,30)..Date.new(2012,8,26),
        9 => Date.new(2012,8,27)..Date.new(2012,9,30),
      10 => Date.new(2012,10,1)..Date.new(2012,10,28),
      11 => Date.new(2012,10,29)..Date.new(2012,11,25),
      12 => Date.new(2012,11,26)..Date.new(2012,12,30) }
    }
  }
  
  it "converts months and years to ranges" do
    dates.each do |year,months|
      months.each do |month,range|
        BroadcastCalendar.dates_for(month,year).should == range
      end
    end
  end

  it "returns the broadcast month and year for a given year" do
    dates.each do |year,months|
      months.each do |month,range|
        range.each do |date|
          BroadcastCalendar.month_and_year_for(date).should == [month,year]
        end
      end
    end
  end
end
