# typed: strong

module Trycourier
  module Models
    class IntercomRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::IntercomRecipient, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { params(id: String).returns(T.attached_class) }
      def self.new(id:)
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end
