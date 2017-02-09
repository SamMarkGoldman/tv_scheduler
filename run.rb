# https://docs.google.com/spreadsheets/d/1lOzuYOb8mHNnMuv2Gdmipx3k24e2yLSyIX2u4lDj5Vg/pub?gid=0&single=true&output=csv

require 'pry'
require 'timecop'
require_relative 'schedule_fetcher'
require_relative 'time_slot'

t = Time.local(2017, 2, 9, 18, 56, 0)
  Timecop.travel(t)


binding.pry
next_change = TimeSlot.find_next_change(ScheduleFetcher.fetch)

exit if next_change.nil?



puts 'asd'