require 'rest_client'

module Greeninvoice
  class Document

    def initialize(options = {})
    end

    def call(json)
      Greeninvoice::JwtStorage.with_token_refresh do
        headers = Greeninvoice::JwtStorage.headers
        response = RestClient.post("#{Greeninvoice.configuration.end_point}/documents", json, headers)
        JSON.parse(response)
      end
    end
  end
end
