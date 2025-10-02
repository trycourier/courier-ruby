# typed: strong

module Courier
  module Models
    class AuthIssueTokenParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AuthIssueTokenParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :expires_in

      sig { returns(String) }
      attr_accessor :scope

      sig do
        params(
          expires_in: String,
          scope: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(expires_in:, scope:, request_options: {})
      end

      sig do
        override.returns(
          {
            expires_in: String,
            scope: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
