# typed: strong

module Trycourier
  module Models
    class BulkAddUsersParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::BulkAddUsersParams, Trycourier::Internal::AnyHash)
        end

      sig { returns(T::Array[Trycourier::InboundBulkMessageUser]) }
      attr_accessor :users

      sig do
        params(
          users: T::Array[Trycourier::InboundBulkMessageUser::OrHash],
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(users:, request_options: {})
      end

      sig do
        override.returns(
          {
            users: T::Array[Trycourier::InboundBulkMessageUser],
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
