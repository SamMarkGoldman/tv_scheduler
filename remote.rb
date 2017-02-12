class Remote
  def self.power
    `irsend SEND_ONCE #{AppConfig::REMOTE_NAME} KEY_POWER`
  end

  def self.channel(channel_string)
    Logger.info "setting channel to #{channel_string}"
    command = channel_string.chars.map { |c| "KEY_#{c}" }.join(' ')
    `irsend SEND_ONCE #{AppConfig::REMOTE_NAME} #{command}`
  end
end