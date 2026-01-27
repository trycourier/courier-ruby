# typed: strong

module Courier
  module Models
    module Discord
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Courier::SendToChannel, Courier::SendDirectMessage)
        end

      sig { override.returns(T::Array[Courier::Discord::Variants]) }
      def self.variants
      end
    end
  end
end
