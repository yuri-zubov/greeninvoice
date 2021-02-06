# frozen_string_literal: true

require_relative "greeninvoice/version"
require_relative "greeninvoice/auth"
require_relative "greeninvoice/config"
require_relative "greeninvoice/document"
require_relative "greeninvoice/jwt_storage"

module Greeninvoice
  class Error < StandardError; end

  def self.configuration
    @configuration ||= Config.new
  end

  def self.config
    config = configuration
    yield(config)
  end
end
