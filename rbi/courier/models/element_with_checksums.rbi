# typed: strong

module Courier
  module Models
    class ElementWithChecksums < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ElementWithChecksums, Courier::Internal::AnyHash)
        end

      # MD5 hash of translatable content.
      sig { returns(String) }
      attr_accessor :checksum

      # Element type (text, meta, action, etc.).
      sig { returns(String) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Nested child elements (for group-type elements).
      sig { returns(T.nilable(T::Array[Courier::ElementWithChecksums])) }
      attr_reader :elements

      sig { params(elements: T::Array[Courier::ElementWithChecksums]).void }
      attr_writer :elements

      # Locale-specific content with checksums.
      sig do
        returns(
          T.nilable(T::Hash[Symbol, Courier::ElementWithChecksums::Locale])
        )
      end
      attr_reader :locales

      sig do
        params(
          locales:
            T::Hash[Symbol, Courier::ElementWithChecksums::Locale::OrHash]
        ).void
      end
      attr_writer :locales

      # An element with its content checksum and optional nested elements and locale
      # checksums.
      sig do
        params(
          checksum: String,
          type: String,
          id: String,
          elements: T::Array[Courier::ElementWithChecksums],
          locales:
            T::Hash[Symbol, Courier::ElementWithChecksums::Locale::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # MD5 hash of translatable content.
        checksum:,
        # Element type (text, meta, action, etc.).
        type:,
        id: nil,
        # Nested child elements (for group-type elements).
        elements: nil,
        # Locale-specific content with checksums.
        locales: nil
      )
      end

      sig do
        override.returns(
          {
            checksum: String,
            type: String,
            id: String,
            elements: T::Array[Courier::ElementWithChecksums],
            locales: T::Hash[Symbol, Courier::ElementWithChecksums::Locale]
          }
        )
      end
      def to_hash
      end

      class Locale < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementWithChecksums::Locale,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :checksum

        sig { params(checksum: String).returns(T.attached_class) }
        def self.new(checksum:)
        end

        sig { override.returns({ checksum: String }) }
        def to_hash
        end
      end
    end
  end
end
