# BroadcastCalendar Gem

This library returns the beginning and ending Gregorian (civil) dates for months in the 
[broadcast calendar](http://en.wikipedia.org/wiki/Broadcast_calendar).

# Installation

    gem install broadcast_calendar

# Usage

Dates are returned as a Range object.

    > BroadcastCalendar.dates_for(5,2011)
    => Mon, 25 Apr 2011..Sun, 29 May 2011 

# Problems? Questions?

Email <mike@subelsky.com> or file an issue on GitHub. Thanks!
