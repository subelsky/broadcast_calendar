$:.unshift(File.dirname(__FILE__))
require 'lib/broadcast_calendar/version'

Gem::Specification.new do |s|
  s.name = %q{broadcast_calendar}
  s.version = BroadcastCalendar::VERSION
  s.authors = ["Mike Subelsky"]
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.email = %q{mike@subelsky.com}
  s.extra_rdoc_files = %w(README.markdown)
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/subelsky/broadcast_calendar}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{eturns the beginning and ending Gregorian (civil) dates for months in the broadcast calendar.}
  s.description = %q{Library tht returns the beginning and ending Gregorian (civil) dates for months in the broadcast calendar.}
  s.test_files = `git ls-files spec`.split("\n")
  s.add_development_dependency 'rspec'
  s.license = "MIT"
end
