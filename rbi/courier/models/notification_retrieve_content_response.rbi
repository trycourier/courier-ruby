# typed: strong

module Courier
  module Models
    # Elemental content response for V2 templates. Contains versioned elements with
    # content checksums.
    module NotificationRetrieveContentResponse
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::NotificationContentGetResponse,
            Courier::NotificationGetContent
          )
        end

      sig do
        override.returns(
          T::Array[
            Courier::Models::NotificationRetrieveContentResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
