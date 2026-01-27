# typed: strong

module Courier
  module Models
    module MessageRoutingChannel
      extend Courier::Internal::Type::Union

      Variants = T.type_alias { T.any(String, Courier::MessageRouting) }

      sig do
        override.returns(T::Array[Courier::MessageRoutingChannel::Variants])
      end
      def self.variants
      end
    end
  end
end
