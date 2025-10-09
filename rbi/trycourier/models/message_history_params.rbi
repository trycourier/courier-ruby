# typed: strong

module Trycourier
  module Models
    class MessageHistoryParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::MessageHistoryParams, Trycourier::Internal::AnyHash)
        end

      # A supported Message History type that will filter the events returned.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig do
        params(
          type: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A supported Message History type that will filter the events returned.
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            type: T.nilable(String),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
