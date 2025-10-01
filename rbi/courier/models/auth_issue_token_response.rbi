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

      sig { returns(T.nilable(String)) }
      attr_accessor :token

      sig { params(token: T.nilable(String)).returns(T.attached_class) }
      def self.new(token: nil)
      end

      sig { override.returns({ token: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
