# typed: strong

module Trycourier
  module Models
    class SendDirectMessage < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SendDirectMessage, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :user_id

      sig { params(user_id: String).returns(T.attached_class) }
      def self.new(user_id:)
      end

      sig { override.returns({ user_id: String }) }
      def to_hash
      end
    end
  end
end
