# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Send#send_message
    class SendSendMessageResponse < Courier::Internal::Type::BaseModel
      # @!attribute request_id
      #   A successful call to `POST /send` returns a `202` status code along with a
      #   `requestId` in the response body.
      #
      #   For send requests that have a single recipient, the `requestId` is assigned to
      #   the derived message as its message_id. Therefore the `requestId` can be supplied
      #   to the Message's API for single recipient messages.
      #
      #   For send requests that have multiple recipients (accounts, audiences, lists,
      #   etc.), Courier assigns a unique id to each derived message as its `message_id`.
      #   Therefore the `requestId` cannot be supplied to the Message's API for
      #   single-recipient messages.
      #
      #   @return [String]
      required :request_id, String, api_name: :requestId

      # @!method initialize(request_id:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::SendSendMessageResponse} for more details.
      #
      #   @param request_id [String] A successful call to `POST /send` returns a `202` status code along with a `requ
    end
  end
end
