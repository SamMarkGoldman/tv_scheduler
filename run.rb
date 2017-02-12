require 'pry'
require 'timecop'
require_relative 'logger'
require_relative 'app_config'
require_relative 'schedule_fetcher'
require_relative 'time_slot'
require_relative 'remote'

# TIMECOP
# t = Time.local(2017, 2, 7, 12, 59, 57)
# Timecop.travel(t)
# TIMECOP

next_change = TimeSlot.find_next_change(ScheduleFetcher.fetch)

Logger.info "Scheduled #{next_change}"
exit if next_change.nil?

sleep next_change.time_until
next_change.execute
