require 'csv'

class Schedule
  def initialize(raw_string, day=Date.today.wday)
    2.times.each do
      second_line_start = (raw_string =~ /\n/) + 1
      raw_string = raw_string[second_line_start..-1]
    end
    data = []
    CSV.parse(raw_string) { |row| data << TimeSlot.new(row[day*3,3]) }
    binding.pry
    puts 'asd'
  end	
end