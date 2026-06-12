# typed: strong

module Courier
  module Models
    class DigestCategory < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::DigestCategory, Courier::Internal::AnyHash)
        end

      # The key that identifies the category within the digest.
      sig { returns(String) }
      attr_accessor :category_key

      # Which events to keep when the number of events exceeds the retention limit for
      # the category.
      sig { returns(Courier::DigestCategory::Retain::TaggedSymbol) }
      attr_accessor :retain

      # The data key used to order events when `retain` is `highest` or `lowest`.
      sig { returns(T.nilable(String)) }
      attr_reader :sort_key

      sig { params(sort_key: String).void }
      attr_writer :sort_key

      sig do
        params(
          category_key: String,
          retain: Courier::DigestCategory::Retain::OrSymbol,
          sort_key: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The key that identifies the category within the digest.
        category_key:,
        # Which events to keep when the number of events exceeds the retention limit for
        # the category.
        retain:,
        # The data key used to order events when `retain` is `highest` or `lowest`.
        sort_key: nil
      )
      end

      sig do
        override.returns(
          {
            category_key: String,
            retain: Courier::DigestCategory::Retain::TaggedSymbol,
            sort_key: String
          }
        )
      end
      def to_hash
      end

      # Which events to keep when the number of events exceeds the retention limit for
      # the category.
      module Retain
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::DigestCategory::Retain) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FIRST = T.let(:first, Courier::DigestCategory::Retain::TaggedSymbol)
        LAST = T.let(:last, Courier::DigestCategory::Retain::TaggedSymbol)
        HIGHEST = T.let(:highest, Courier::DigestCategory::Retain::TaggedSymbol)
        LOWEST = T.let(:lowest, Courier::DigestCategory::Retain::TaggedSymbol)
        NONE = T.let(:none, Courier::DigestCategory::Retain::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::DigestCategory::Retain::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
