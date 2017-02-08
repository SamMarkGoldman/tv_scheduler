require 'time'

class TimeSlot
  attr_reader :time, :channel, :note

  def initialize(slot_arr)
    @time = Time.parse(slot_arr[0])
    @channel = slot_arr[1]
    @note = slot_arr[2]
  end
end