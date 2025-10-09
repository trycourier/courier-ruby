# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Send#message
    class SendMessageResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute request_id
      #   A successful call to `POST /send` returns a `202` status code along with a
      #   `requestId` in the response body. For single-recipient requests, the `requestId`
      #   is the derived message_id. For multiple recipients, Courier assigns a unique
      #   message_id to each derived message.
      #
      #   @return [String]
      required :request_id, String, api_name: :requestId

      # @!method initialize(request_id:)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::SendMessageResponse} for more details.
      #
      #   @param request_id [String] A successful call to `POST /send` returns a `202` status code along with a `requ
    end
  end
end
