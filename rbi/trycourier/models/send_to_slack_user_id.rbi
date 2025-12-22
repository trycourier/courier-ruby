# typed: strong

module Trycourier
  module Models
    class SendToSlackUserID < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SendToSlackUserID, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :access_token

      sig { returns(String) }
      attr_accessor :user_id

      sig do
        params(access_token: String, user_id: String).returns(T.attached_class)
      end
      def self.new(access_token:, user_id:)
      end

      sig { override.returns({ access_token: String, user_id: String }) }
      def to_hash
      end
    end
  end
end
