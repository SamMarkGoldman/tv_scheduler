require 'time'
require 'csv'

class TimeSlot
  attr_reader :time, :channel, :note

  def self.find_next_change(csv_string)
    all_slots = []
    day = Date.today.wday
    now = Time.now

    CSV.parse(csv_string) { |row| all_slots << TimeSlot.new(row[day*3,3]) }
    all_slots.find { |s| s.time - now > 0 && s.time - now <= Config::RUN_INTERVAL }
  end

  def initialize(slot_arr)
    @time = Time.parse(slot_arr[0])
    @channel = slot_arr[1]
    @note = slot_arr[2]
  end

  def time_until
    time - Time.now
  end

  def execute
    Remote.channel @channel
  end
end