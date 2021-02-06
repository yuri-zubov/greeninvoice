require 'rest_client'
require 'json'

module Greeninvoice
  class Auth
    def initialize(options = {})
      @end_point = options[:end_point] || Greeninvoice.configuration.end_point

      @id = options[:id] || Greeninvoice.configuration.id
      @secret = options[:secret] || Greeninvoice.configuration.secret

    end

    def call
      values = {
        id: @id,
        secret: @secret
      }

      headers = {
        :content_type => 'application/json'
      }
      response = RestClient.post "#{Greeninvoice.configuration.end_point}/account/token", values.to_json, headers
      JSON.parse(response)
    end

  end
end


