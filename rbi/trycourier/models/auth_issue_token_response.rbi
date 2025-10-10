# typed: strong

module Trycourier
  module Models
    class AuthIssueTokenResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::AuthIssueTokenResponse,
            Trycourier::Internal::AnyHash
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
