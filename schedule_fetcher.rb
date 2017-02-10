require 'net/http'

class ScheduleFetcher
  URL = URI(Config::SCHEDULE_URL)
  
  def self.fetch
    new.fetch
  end

  def fetch
    csv = nil
    begin
      csv = Net::HTTP.get(URL)
      File.write(Config::BACKUP_FILE_NAME, csv)
    rescue SocketError
    binding.pry
      csv = File.read(Config::BACKUP_FILE_NAME)
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