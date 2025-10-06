# typed: strong

module Courier
  module Models
    class AuthIssueTokenResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::AuthIssueTokenResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :token

      sig { params(token: String).returns(T.attached_class) }
      def self.new(token:)
      end

      sig { override.returns({ token: String }) }
      def to_hash
      end
    end
  end
end
