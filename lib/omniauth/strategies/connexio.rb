require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Connexio < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site:      'https://login.connexiolabs.com',
        token_url: '/oauth/access_token'
      }

      uid { raw_info['id'] }

      info do
        {
          name:        "#{raw_info['first_name']} #{raw_info['last_name']}",
          email:       raw_info['email_address'],
          first_name:  raw_info['first_name'],
          last_name:   raw_info['last_name'],
          phone:       raw_info['phone_number']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query

        @raw_info ||= access_token.get('/oauth/user').parsed
      end
    end
  end
end
