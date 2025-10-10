# typed: strong

module Trycourier
  module Models
    class MessageListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::MessageListParams, Trycourier::Internal::AnyHash)
        end

      # A boolean value that indicates whether archived messages should be included in
      # the response.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :archived

      # A unique identifier that allows for fetching the next set of messages.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # The enqueued datetime of a message to filter out messages received before.
      sig { returns(T.nilable(String)) }
      attr_accessor :enqueued_after

      # A unique identifier representing the event that was used to send the event.
      sig { returns(T.nilable(String)) }
      attr_accessor :event

      # A unique identifier representing the list the message was sent to.
      sig { returns(T.nilable(String)) }
      attr_accessor :list

      # A unique identifier representing the message_id returned from either /send or
      # /send/list.
      sig { returns(T.nilable(String)) }
      attr_accessor :message_id

      # A unique identifier representing the notification that was used to send the
      # event.
      sig { returns(T.nilable(String)) }
      attr_accessor :notification

      # The key assocated to the provider you want to filter on. E.g., sendgrid, inbox,
      # twilio, slack, msteams, etc. Allows multiple values to be set in query
      # parameters.
      sig { returns(T.nilable(T::Array[T.nilable(String)])) }
      attr_reader :provider

      sig { params(provider: T::Array[T.nilable(String)]).void }
      attr_writer :provider

      # A unique identifier representing the recipient associated with the requested
      # profile.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient

      # An indicator of the current status of the message. Allows multiple values to be
      # set in query parameters.
      sig { returns(T.nilable(T::Array[T.nilable(String)])) }
      attr_reader :status

      sig { params(status: T::Array[T.nilable(String)]).void }
      attr_writer :status

      # A tag placed in the metadata.tags during a notification send. Allows multiple
      # values to be set in query parameters.
      sig { returns(T.nilable(T::Array[T.nilable(String)])) }
      attr_reader :tag

      sig { params(tag: T::Array[T.nilable(String)]).void }
      attr_writer :tag

      # A comma delimited list of 'tags'. Messages will be returned if they match any of
      # the tags passed in.
      sig { returns(T.nilable(String)) }
      attr_accessor :tags

      # Messages sent with the context of a Tenant
      sig { returns(T.nilable(String)) }
      attr_accessor :tenant_id

      # The unique identifier used to trace the requests
      sig { returns(T.nilable(String)) }
      attr_accessor :trace_id

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
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
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
