require 'httparty'

module Blimp
  class API
    class << self
      @@base_uri  = "https://app.getblimp.com/api/v2/"

      def headers
        @headers ||= { 'accept' => 'application/json',
          'content-type' => 'application/json',
          'Authorization' => "ApiKey #{Blimp.username}:#{Blimp.api_key}",
          'X_BLIMP_APPID' => Blimp.app_id,
          'X_BLIMP_SECRET' => Blimp.app_secret,
          'User-Agent' => "Blimp-gem/#{Blimp::VERSION}"
        }
      end

      def method_missing method_name, *args
        super(method_name, args) unless [:get, :post, :put, :patch, :head, :destroy].include? method_name
        uri = @@base_uri + args.shift

        body = nil
        body = args.shift[:body] if args.first.has_key? :body

        query = nil
        query = args.shift

        HTTParty.send(method_name, uri, headers: headers, query: query, body: body)
      end
    end

    class ResponseError < StandardError
    end

    class NotFound < ResponseError
    end

    class Forbidden < ResponseError
    end

    class InternalServerError < ResponseError
    end

  end
end

