# typed: strong

module Trycourier
  module Models
    class NotificationListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Trycourier::NotificationListParams,
            Trycourier::Internal::AnyHash
          )
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
          request_options: Trycourier::RequestOptions::OrHash
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
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
