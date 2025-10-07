# typed: strong

module Courier
  module Models
    module Recipient
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias { T.any(Courier::UserRecipient, Courier::ListRecipient) }

      sig { override.returns(T::Array[Courier::Recipient::Variants]) }
      def self.variants
      end
    end
  end
end
