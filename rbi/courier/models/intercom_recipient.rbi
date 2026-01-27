# typed: strong

module Courier
  module Models
    class IntercomRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::IntercomRecipient, Courier::Internal::AnyHash)
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
