# frozen_string_literal: true

module Courier
  module Translations
    class Client
      # @return [Courier::Translations::Client]
      def initialize(client:)
        @client = client
      end

      # Get translations by locale
      #
      # @return [String]
      def get(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/translations/#{params[:domain]}/#{params[:locale]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        return if code.between?(200, 299)

        error_class = Courier::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(_response.body, code: code)
      end

      # Update a translation
      #
      # @return [untyped]
      def update(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PUT",
          path: "/translations/#{params[:domain]}/#{params[:locale]}",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        return if code.between?(200, 299)

        error_class = Courier::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(_response.body, code: code)
      end
    end
  end
end
