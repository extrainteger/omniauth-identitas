require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Identitas < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :identitas

      option :client_options, {
        :site => "http://localhost:3000",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me.json').parsed
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end