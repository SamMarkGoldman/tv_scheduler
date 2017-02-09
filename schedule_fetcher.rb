require 'net/http'

class ScheduleFetcher
  URL = URI('https://docs.google.com/spreadsheets/d/1lOzuYOb8mHNnMuv2Gdmipx3k24e2yLSyIX2u4lDj5Vg/pub?gid=0&single=true&output=csv')
  
  def self.fetch
    new.fetch
  end

  def fetch
    csv = nil
    begin
      csv = Net::HTTP.get(URL)
      File.write('local_schedule_backup', csv)
    rescue SocketError
    binding.pry
      csv = File.read('local_schedule_backup')
    end
    strip_headers csv
  end

  def strip_headers(raw_string)
    2.times.each do
      second_line_start = (raw_string =~ /\n/) + 1
      raw_string = raw_string[second_line_start..-1]
    end
    raw_string
  end
end