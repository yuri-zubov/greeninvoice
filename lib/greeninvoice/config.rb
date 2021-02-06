require 'active_support/configurable'
require 'active_support/cache'

module Greeninvoice
  class Config
    include ::ActiveSupport::Configurable

    config_accessor :end_point, :id, :secret, :jwt_store

    # sandbox end_point - https://sandbox.d.greeninvoice.co.il/api/v1/
    # production end_point - https://api.greeninvoice.co.il/api/v1/

    def initialize(options = {})
      options.each do |key, value|
        config.send("#{key}=", value)
      end
      config.jwt_store ||= ActiveSupport::Cache::MemoryStore.new
    end
  end
end
