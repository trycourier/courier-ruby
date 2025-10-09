# typed: strong

module Trycourier
  module Models
    module MessageRoutingChannel
      extend Trycourier::Internal::Type::Union

      Variants = T.type_alias { T.any(String, Trycourier::MessageRouting) }

      sig do
        override.returns(T::Array[Trycourier::MessageRoutingChannel::Variants])
      end
      def self.variants
      end
    end
  end
end
