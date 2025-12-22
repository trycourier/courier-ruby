# typed: strong

module Trycourier
  module Models
    module Discord
      extend Trycourier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Trycourier::SendToChannel, Trycourier::SendDirectMessage)
        end

      sig { override.returns(T::Array[Trycourier::Discord::Variants]) }
      def self.variants
      end
    end
  end
end
