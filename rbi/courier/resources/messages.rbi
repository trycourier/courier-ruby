# typed: strong

module Courier
  module Resources
    class Messages
      # Returns a sent message's status, recipient, event, and per-provider delivery
      # detail, with timestamps for enqueued, sent, delivered, opened, and clicked.
      sig do
        params(
          message_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::MessageRetrieveResponse)
      end
      def retrieve(
        # A unique identifier associated with the message you wish to retrieve (results
        # from a send).
        message_id,
        request_options: {}
      )
      end

      # Returns previously sent messages, most recent first, each carrying its status,
      # recipient, channel, and provider. Paged by cursor.
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
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::MessageListResponse)
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

      # Cancels a message that is still in the delivery pipeline and returns the message
      # record with its resulting canceled or failed status.
      sig do
        params(
          message_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::MessageDetails)
      end
      def cancel(
        # A unique identifier representing the message ID
        message_id,
        request_options: {}
      )
      end

      # Returns the rendered content Courier delivered for a message, broken out per
      # channel, to confirm what the recipient received.
      sig do
        params(
          message_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::MessageContentResponse)
      end
      def content(
        # A unique identifier associated with the message you wish to retrieve (results
        # from a send).
        message_id,
        request_options: {}
      )
      end

      # Returns the ordered event history for a sent message, one entry per status
      # transition with its timestamp.
      sig do
        params(
          message_id: String,
          type: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::MessageHistoryResponse)
      end
      def history(
        # A unique identifier representing the message ID
        message_id,
        # A supported Message History type that will filter the events returned.
        type: nil,
        request_options: {}
      )
      end

      # Resends a previously sent message to the same recipient and content, returning a
      # new messageId. The original send request is not modified.
      sig do
        params(
          message_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::MessageResendResponse)
      end
      def resend(
        # A unique identifier representing the message ID of the original message to
        # resend.
        message_id,
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
