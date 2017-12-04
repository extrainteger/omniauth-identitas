require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Identitas < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :identitas

      option :client_options, {
        site: "https://api.identitas.com",
        authorize_url: "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"],
          first_name: raw_info["first_name"],
          last_name: raw_info["last_name"],
          name: [raw_info["first_name"], raw_info["last_name"]].join(" ")
        }
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info unless skip_info?
        hash['m'] = request.params["m"]
        hash['application_info'] = application_info
        hash
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me').parsed["info"]
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      # # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path + check_if_mobile
      end

      def check_if_mobile
        "?" + {m: options.authorize_params[:m]}.to_query
      end

      def setup_phase
        options.authorize_params[:m] = request.params["m"]
      end

      def application_info
        @application_info ||= access_token.get('/v1/app/info').parsed
      end

    end
  end
end