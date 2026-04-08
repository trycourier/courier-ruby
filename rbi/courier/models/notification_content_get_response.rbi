# typed: strong

module Courier
  module Models
    class NotificationContentGetResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationContentGetResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Courier::ElementWithChecksums]) }
      attr_accessor :elements

      # Content version identifier.
      sig { returns(String) }
      attr_accessor :version

      # Elemental content response for V2 templates. Contains versioned elements with
      # content checksums.
      sig do
        params(
          elements: T::Array[Courier::ElementWithChecksums::OrHash],
          version: String
        ).returns(T.attached_class)
      end
      def self.new(
        elements:,
        # Content version identifier.
        version:
      )
      end

      sig do
        override.returns(
          { elements: T::Array[Courier::ElementWithChecksums], version: String }
        )
      end
      def to_hash
      end
    end
  end
end
