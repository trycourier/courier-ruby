# typed: strong

module Trycourier
  module Models
    class AuthIssueTokenParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::AuthIssueTokenParams, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :expires_in

      sig { returns(String) }
      attr_accessor :scope

      sig do
        params(
          expires_in: String,
          scope: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(expires_in:, scope:, request_options: {})
      end

      sig do
        override.returns(
          {
            expires_in: String,
            scope: String,
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
