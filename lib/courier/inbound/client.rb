# frozen_string_literal: true

module Courier
  module Inbound
    class Client
      # @return [Courier::Inbound::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Courier::Inbound::Types::TrackAcceptedResponse]
      def track(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "/inbound/courier",
          body: Courier::Inbound::Types::InboundTrackEvent.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Inbound::Types::TrackAcceptedResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
