# typed: strong

module Trycourier
  module Models
    class SendToSlackEmail < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SendToSlackEmail, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :access_token

      sig { returns(String) }
      attr_accessor :email

      sig do
        params(access_token: String, email: String).returns(T.attached_class)
      end
      def self.new(access_token:, email:)
      end

      sig { override.returns({ access_token: String, email: String }) }
      def to_hash
      end
    end
  end
end
