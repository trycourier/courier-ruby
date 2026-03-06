# typed: strong

module Courier
  module Models
    class MessageHistoryParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::MessageHistoryParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :message_id

      # A supported Message History type that will filter the events returned.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig do
        params(
          message_id: String,
          type: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        message_id:,
        # A supported Message History type that will filter the events returned.
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            message_id: String,
            type: T.nilable(String),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
