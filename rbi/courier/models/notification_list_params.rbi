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

      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # Retrieve the notes from the Notification template settings.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :notes

      sig do
        params(
          cursor: T.nilable(String),
          notes: T.nilable(T::Boolean),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        cursor: nil,
        # Retrieve the notes from the Notification template settings.
        notes: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: T.nilable(String),
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
