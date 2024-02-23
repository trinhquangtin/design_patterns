# app/services/logger_service.rb

class LoggerService
  def self.call(params)
    puts params
  end
end

# app/services/service.rb
# normal way
# this violate the dependency inverse injection in SOLID
# class Service
#   def call
#     LoggerService.call('Something happened')
#   end
# end

# Service.new.call

# dependency injection in plain way
class Service
  attr_accessor :logger_service

  def initialize(logger_service:)
    @logger_service = logger_service
  end

  def call
    logger_service.call('Something happened')
  end
end

Service.new(logger_service: LoggerService).call
