require 'active_support/configurable'
require 'active_support'

module Greeninvoice
  class JwtStorage
    def self.headers
      {
        :content_type => 'application/json',
        :authorization => "Bearer #{fetch_jwt}"
      }
    end

    def self.fetch_jwt
      @jwt = Greeninvoice.configuration.jwt_store.read('greeninvoice_jwt')
      unless @jwt.present?
        result = Greeninvoice::Auth.new.call
        @jwt = result['token']
        Greeninvoice.configuration.jwt_store.write('greeninvoice_jwt', @jwt, expires_in: Time.at(result.fetch('expires')) - 5*60 - Time.now)
      end
      return @jwt
    end

    def self.with_token_refresh
      yield
    rescue StandardError
      # delete jwt, then yield to re-fetch
      Greeninvoice.configuration.jwt_store.delete('greeninvoice_jwt')
      yield
    end

  end
end
