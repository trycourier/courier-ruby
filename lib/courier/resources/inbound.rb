# frozen_string_literal: true

module Courier
  module Resources
    class Inbound
      # Some parameter documentations has been truncated, see
      # {Courier::Models::InboundTrackEventParams} for more details.
      #
      # Courier Track Event
      #
      # @overload track_event(event:, message_id:, properties:, type:, user_id: nil, request_options: {})
      #
      # @param event [String] A descriptive name of the event. This name will appear as a trigger in the Couri
      #
      # @param message_id [String] A required unique identifier that will be used to de-duplicate requests. If not
      #
      # @param properties [Hash{Symbol=>Object}]
      #
      # @param type [Symbol, Courier::Models::InboundTrackEventParams::Type]
      #
      # @param user_id [String, nil] The user id associatiated with the track
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::InboundTrackEventResponse]
      #
      # @see Courier::Models::InboundTrackEventParams
      def track_event(params)
        parsed, options = Courier::InboundTrackEventParams.dump_request(params)
        @client.request(
          method: :post,
          path: "inbound/courier",
          body: parsed,
          model: Courier::Models::InboundTrackEventResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
