class Remote
  def self.power
    `irsend SEND_ONCE #{Config::REMOTE_NAME} KEY_POWER`
  end

  def self.channel(channel_string)
    channel_string.each_char do |c|
      `irsend SEND_ONCE #{Config::REMOTE_NAME} KEY_#{c}`
      sleep 0.2
    end
  end
end