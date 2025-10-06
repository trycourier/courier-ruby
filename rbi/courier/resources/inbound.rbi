# typed: strong

module Courier
  module Resources
    class Inbound
      # Courier Track Event
      sig do
        params(
          event: String,
          message_id: String,
          properties: T::Hash[Symbol, T.anything],
          type: Courier::InboundTrackEventParams::Type::OrSymbol,
          user_id: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::InboundTrackEventResponse)
      end
      def track_event(
        # A descriptive name of the event. This name will appear as a trigger in the
        # Courier Automation Trigger node.
        event:,
        # A required unique identifier that will be used to de-duplicate requests. If not
        # unique, will respond with 409 Conflict status
        message_id:,
        properties:,
        type:,
        # The user id associatiated with the track
        user_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
