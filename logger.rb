require 'syslog/logger'

class Logger
  def self.info message
    logger.info(message)
  end

  def self.logger
    @@logger ||= Syslog::Logger.new 'tv_scheduler'
  end
end