# typed: strong

module Courier
  module Models
    class NotificationListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::NotificationListParams, Courier::Internal::AnyHash)
        end

      # Opaque pagination cursor from a previous response. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # Filter to templates linked to this event map ID.
      sig { returns(T.nilable(String)) }
      attr_reader :event_id

      sig { params(event_id: String).void }
      attr_writer :event_id

      # Include template notes in the response. Only applies to legacy templates.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :notes

      sig do
        params(
          cursor: T.nilable(String),
          event_id: String,
          notes: T.nilable(T::Boolean),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Filter to templates linked to this event map ID.
        event_id: nil,
        # Include template notes in the response. Only applies to legacy templates.
        notes: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: T.nilable(String),
            event_id: String,
            notes: T.nilable(T::Boolean),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
