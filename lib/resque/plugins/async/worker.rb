require 'resque-retry'

class Resque::Plugins::Async::Worker
  extend Resque::Plugins::Retry
  @retry_limit = ENV['RESQUE_RETRY_LIMIT'] || 3
  @retry_delay = ENV['RESQUE_RETRY_DELAY'] || 10

  @queue        = :async_methods
  @loner        = false

  class << self

    attr_accessor :queue
    attr_accessor :loner
    attr_accessor :lock_timeout

    def perform klass, *args
      klass.constantize.find(args.shift).send(args.shift, *args)
    end
  end
end