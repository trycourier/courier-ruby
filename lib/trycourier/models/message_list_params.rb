# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Messages#list
    class MessageListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute archived
      #   A boolean value that indicates whether archived messages should be included in
      #   the response.
      #
      #   @return [Boolean, nil]
      optional :archived, Trycourier::Internal::Type::Boolean, nil?: true

      # @!attribute cursor
      #   A unique identifier that allows for fetching the next set of messages.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute enqueued_after
      #   The enqueued datetime of a message to filter out messages received before.
      #
      #   @return [String, nil]
      optional :enqueued_after, String, nil?: true

      # @!attribute event
      #   A unique identifier representing the event that was used to send the event.
      #
      #   @return [String, nil]
      optional :event, String, nil?: true

      # @!attribute list
      #   A unique identifier representing the list the message was sent to.
      #
      #   @return [String, nil]
      optional :list, String, nil?: true

      # @!attribute message_id
      #   A unique identifier representing the message_id returned from either /send or
      #   /send/list.
      #
      #   @return [String, nil]
      optional :message_id, String, nil?: true

      # @!attribute notification
      #   A unique identifier representing the notification that was used to send the
      #   event.
      #
      #   @return [String, nil]
      optional :notification, String, nil?: true

      # @!attribute provider
      #   The key assocated to the provider you want to filter on. E.g., sendgrid, inbox,
      #   twilio, slack, msteams, etc. Allows multiple values to be set in query
      #   parameters.
      #
      #   @return [Array<String, nil>, nil]
      optional :provider, Trycourier::Internal::Type::ArrayOf[String, nil?: true]

      # @!attribute recipient
      #   A unique identifier representing the recipient associated with the requested
      #   profile.
      #
      #   @return [String, nil]
      optional :recipient, String, nil?: true

      # @!attribute status
      #   An indicator of the current status of the message. Allows multiple values to be
      #   set in query parameters.
      #
      #   @return [Array<String, nil>, nil]
      optional :status, Trycourier::Internal::Type::ArrayOf[String, nil?: true]

      # @!attribute tag
      #   A tag placed in the metadata.tags during a notification send. Allows multiple
      #   values to be set in query parameters.
      #
      #   @return [Array<String, nil>, nil]
      optional :tag, Trycourier::Internal::Type::ArrayOf[String, nil?: true]

      # @!attribute tags
      #   A comma delimited list of 'tags'. Messages will be returned if they match any of
      #   the tags passed in.
      #
      #   @return [String, nil]
      optional :tags, String, nil?: true

      # @!attribute tenant_id
      #   Messages sent with the context of a Tenant
      #
      #   @return [String, nil]
      optional :tenant_id, String, nil?: true

      # @!attribute trace_id
      #   The unique identifier used to trace the requests
      #
      #   @return [String, nil]
      optional :trace_id, String, nil?: true

      # @!method initialize(archived: nil, cursor: nil, enqueued_after: nil, event: nil, list: nil, message_id: nil, notification: nil, provider: nil, recipient: nil, status: nil, tag: nil, tags: nil, tenant_id: nil, trace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::MessageListParams} for more details.
      #
      #   @param archived [Boolean, nil] A boolean value that indicates whether archived messages should be included in t
      #
      #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of messages.
      #
      #   @param enqueued_after [String, nil] The enqueued datetime of a message to filter out messages received before.
      #
      #   @param event [String, nil] A unique identifier representing the event that was used to send the event.
      #
      #   @param list [String, nil] A unique identifier representing the list the message was sent to.
      #
      #   @param message_id [String, nil] A unique identifier representing the message_id returned from either /send or /s
      #
      #   @param notification [String, nil] A unique identifier representing the notification that was used to send the even
      #
      #   @param provider [Array<String, nil>] The key assocated to the provider you want to filter on. E.g., sendgrid, inbox,
      #
      #   @param recipient [String, nil] A unique identifier representing the recipient associated with the requested pro
      #
      #   @param status [Array<String, nil>] An indicator of the current status of the message. Allows multiple values to be
      #
      #   @param tag [Array<String, nil>] A tag placed in the metadata.tags during a notification send. Allows multiple va
      #
      #   @param tags [String, nil] A comma delimited list of 'tags'. Messages will be returned if they match any of
      #
      #   @param tenant_id [String, nil] Messages sent with the context of a Tenant
      #
      #   @param trace_id [String, nil] The unique identifier used to trace the requests
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
