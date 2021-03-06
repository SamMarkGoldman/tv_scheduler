require 'net/http'

class ScheduleFetcher
  URL = URI(AppConfig::SCHEDULE_URL)
  
  def self.fetch
    new.fetch
  end

  def fetch
    csv = nil
    begin
      csv = Net::HTTP.get(URL)
      File.write(AppConfig::BACKUP_FILE_NAME, csv)
    rescue SocketError
      Logger.info "Problem getting network schedule. Reading from local backup file."
      csv = File.read(AppConfig::BACKUP_FILE_NAME)
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