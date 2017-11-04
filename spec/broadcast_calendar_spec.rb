require 'broadcast_calendar'

describe BroadcastCalendar do
  let(:dates) {
    { 2010 =>
      { 1 => Date.new(2009, 12, 28)..Date.new(2010, 1, 31),
        2 => Date.new(2010, 2, 1)..Date.new(2010, 2, 28),
        3 => Date.new(2010, 3, 1)..Date.new(2010, 3, 28),
        4 => Date.new(2010, 3, 29)..Date.new(2010, 4, 25),
        5 => Date.new(2010, 4, 26)..Date.new(2010, 5, 30),
        6 => Date.new(2010, 5, 31)..Date.new(2010, 6, 27),
        7 => Date.new(2010, 6, 28)..Date.new(2010, 7, 25),
        8 => Date.new(2010, 7, 26)..Date.new(2010, 8, 29),
        9 => Date.new(2010, 8, 30)..Date.new(2010, 9, 26),
      10 => Date.new(2010, 9, 27)..Date.new(2010, 10, 31),
      11 => Date.new(2010, 11, 1)..Date.new(2010, 11, 28),
      12 => Date.new(2010, 11, 29)..Date.new(2010, 12, 26) },

      2011 =>
      { 1 => Date.new(2010, 12, 27)..Date.new(2011, 1, 30),
        2 => Date.new(2011, 1, 31)..Date.new(2011, 2, 27),
        3 => Date.new(2011, 2, 28)..Date.new(2011, 3, 27),
        4 => Date.new(2011, 3, 28)..Date.new(2011, 4, 24),
        5 => Date.new(2011, 4, 25)..Date.new(2011, 5, 29),
        6 => Date.new(2011, 5, 30)..Date.new(2011, 6, 26),
        7 => Date.new(2011, 6, 27)..Date.new(2011, 7, 31),
        8 => Date.new(2011, 8, 1)..Date.new(2011, 8, 28),
        9 => Date.new(2011, 8, 29)..Date.new(2011, 9, 25),
      10 => Date.new(2011, 9, 26)..Date.new(2011, 10, 30),
      11 => Date.new(2011, 10, 31)..Date.new(2011, 11, 27),
      12 => Date.new(2011, 11, 28)..Date.new(2011, 12, 25) },

      2012 =>
      { 1 => Date.new(2011, 12, 26)..Date.new(2012, 1, 29),
        2 => Date.new(2012, 1, 30)..Date.new(2012, 2, 26),
        3 => Date.new(2012, 2, 27)..Date.new(2012, 3, 25),
        4 => Date.new(2012, 3, 26)..Date.new(2012, 4, 29),
        5 => Date.new(2012, 4, 30)..Date.new(2012, 5, 27),
        6 => Date.new(2012, 5, 28)..Date.new(2012, 6, 24),
        7 => Date.new(2012, 6, 25)..Date.new(2012, 7, 29),
        8 => Date.new(2012, 7, 30)..Date.new(2012, 8, 26),
        9 => Date.new(2012, 8, 27)..Date.new(2012, 9, 30),
      10 => Date.new(2012, 10, 1)..Date.new(2012, 10, 28),
      11 => Date.new(2012, 10, 29)..Date.new(2012, 11, 25),
      12 => Date.new(2012, 11, 26)..Date.new(2012, 12, 30) }
    }
  }

  describe '#dates_for' do
    it 'converts months and years to ranges' do
      dates.each do |year,months|
        months.each do |month,range|
          expect(BroadcastCalendar.dates_for(month, year)).to eql range
        end
      end
    end
  end

  describe '#dates_for_week' do
    it { expect(BroadcastCalendar.dates_for_week(2017, 1)).to eql Date.new(2016, 12, 26)..Date.new(2017, 1, 1) }
    it { expect(BroadcastCalendar.dates_for_week(2017, 4)).to eql Date.new(2017, 1, 16)..Date.new(2017, 1, 22) }
    it { expect(BroadcastCalendar.dates_for_week(2018, 22)).to eql Date.new(2018, 5, 28)..Date.new(2018, 6, 3) }
    it { expect(BroadcastCalendar.dates_for_week(2018, 52)).to eql Date.new(2018, 12, 24)..Date.new(2018, 12, 30) }
  end

  describe '#month_and_year_for' do
    it 'returns the broadcast month and year for a given year' do
      dates.each do |year, months|
        months.each do |month, range|
          range.each do |date|
            expect(BroadcastCalendar.month_and_year_for(date)).to eql [month, year]
          end
        end
      end
    end
  end

  describe '#weeks_for' do
    it 'returns the correct broadcast weeks for July 2011' do
      weeks = BroadcastCalendar.weeks_for(7, 2011)
      expect(weeks[0]).to eql Date.new(2011, 6, 27)..Date.new(2011, 7, 3)
      expect(weeks[1]).to eql Date.new(2011, 7, 4)..Date.new(2011, 7, 10)
      expect(weeks[2]).to eql Date.new(2011, 7, 11)..Date.new(2011, 7, 17)
      expect(weeks[3]).to eql Date.new(2011, 7, 18)..Date.new(2011, 7, 24)
      expect(weeks[4]).to eql Date.new(2011, 7, 25)..Date.new(2011, 7, 31)
    end

    it 'returns the correct broadcast weeks for August 2010' do
      weeks = BroadcastCalendar.weeks_for(8, 2010)
      expect(weeks[0]).to eql Date.new(2010, 7, 26)..Date.new(2010, 8, 1)
      expect(weeks[1]).to eql Date.new(2010, 8, 2)..Date.new(2010, 8, 8)
      expect(weeks[2]).to eql Date.new(2010, 8, 9)..Date.new(2010, 8, 15)
      expect(weeks[3]).to eql Date.new(2010, 8, 16)..Date.new(2010, 8, 22)
      expect(weeks[4]).to eql Date.new(2010, 8, 23)..Date.new(2010, 8, 29)
    end
  end
end
