require 'logger'

class Logger
  def self.info message
    logger.info(message)
  end

  def self.logger
    @@logger ||= Logger.new('log')
  end
end