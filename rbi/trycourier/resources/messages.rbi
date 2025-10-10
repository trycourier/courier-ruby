# typed: strong

module Trycourier
  module Resources
    class Messages
      # Fetch the status of a message you've previously sent.
      sig do
        params(
          message_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::MessageRetrieveResponse)
      end
      def retrieve(
        # A unique identifier associated with the message you wish to retrieve (results
        # from a send).
        message_id,
        request_options: {}
      )
      end

      # Fetch the statuses of messages you've previously sent.
      sig do
        params(
          archived: T.nilable(T::Boolean),
          cursor: T.nilable(String),
          enqueued_after: T.nilable(String),
          event: T.nilable(String),
          list: T.nilable(String),
          message_id: T.nilable(String),
          notification: T.nilable(String),
          provider: T::Array[T.nilable(String)],
          recipient: T.nilable(String),
          status: T::Array[T.nilable(String)],
          tag: T::Array[T.nilable(String)],
          tags: T.nilable(String),
          tenant_id: T.nilable(String),
          trace_id: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::MessageListResponse)
      end
      def list(
        # A boolean value that indicates whether archived messages should be included in
        # the response.
        archived: nil,
        # A unique identifier that allows for fetching the next set of messages.
        cursor: nil,
        # The enqueued datetime of a message to filter out messages received before.
        enqueued_after: nil,
        # A unique identifier representing the event that was used to send the event.
        event: nil,
        # A unique identifier representing the list the message was sent to.
        list: nil,
        # A unique identifier representing the message_id returned from either /send or
        # /send/list.
        message_id: nil,
        # A unique identifier representing the notification that was used to send the
        # event.
        notification: nil,
        # The key assocated to the provider you want to filter on. E.g., sendgrid, inbox,
        # twilio, slack, msteams, etc. Allows multiple values to be set in query
        # parameters.
        provider: nil,
        # A unique identifier representing the recipient associated with the requested
        # profile.
        recipient: nil,
        # An indicator of the current status of the message. Allows multiple values to be
        # set in query parameters.
        status: nil,
        # A tag placed in the metadata.tags during a notification send. Allows multiple
        # values to be set in query parameters.
        tag: nil,
        # A comma delimited list of 'tags'. Messages will be returned if they match any of
        # the tags passed in.
        tags: nil,
        # Messages sent with the context of a Tenant
        tenant_id: nil,
        # The unique identifier used to trace the requests
        trace_id: nil,
        request_options: {}
      )
      end

      # Cancel a message that is currently in the process of being delivered. A
      # well-formatted API call to the cancel message API will return either `200`
      # status code for a successful cancellation or `409` status code for an
      # unsuccessful cancellation. Both cases will include the actual message record in
      # the response body (see details below).
      sig do
        params(
          message_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::MessageDetails)
      end
      def cancel(
        # A unique identifier representing the message ID
        message_id,
        request_options: {}
      )
      end

      # Get message content
      sig do
        params(
          message_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::MessageContentResponse)
      end
      def content(
        # A unique identifier associated with the message you wish to retrieve (results
        # from a send).
        message_id,
        request_options: {}
      )
      end

      # Fetch the array of events of a message you've previously sent.
      sig do
        params(
          message_id: String,
          type: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::MessageHistoryResponse)
      end
      def history(
        # A unique identifier representing the message ID
        message_id,
        # A supported Message History type that will filter the events returned.
        type: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
