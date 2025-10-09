# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Inbound#track_event
    class InboundTrackEventResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute message_id
      #   A successful call returns a `202` status code along with a `requestId` in the
      #   response body.
      #
      #   @return [String]
      required :message_id, String, api_name: :messageId

      # @!method initialize(message_id:)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::InboundTrackEventResponse} for more details.
      #
      #   @param message_id [String] A successful call returns a `202` status code along with a `requestId` in the re
    end
  end
end
