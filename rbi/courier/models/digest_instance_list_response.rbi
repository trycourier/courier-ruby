# typed: strong

module Courier
  module Models
    class DigestInstanceListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::DigestInstanceListResponse, Courier::Internal::AnyHash)
        end

      # Whether there are more digest instances to fetch using the cursor.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # The digest instances for this page of results.
      sig { returns(T::Array[Courier::DigestInstance]) }
      attr_accessor :items

      # Always `list` for a paginated list response.
      sig { returns(Courier::DigestInstanceListResponse::Type::TaggedSymbol) }
      attr_accessor :type

      # A cursor token for fetching the next page of results, or null when there are
      # none.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # The path to fetch the next page of results, or null when there are none.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_url

      # The path of the current request.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          has_more: T::Boolean,
          items: T::Array[Courier::DigestInstance::OrHash],
          type: Courier::DigestInstanceListResponse::Type::OrSymbol,
          cursor: T.nilable(String),
          next_url: T.nilable(String),
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether there are more digest instances to fetch using the cursor.
        has_more:,
        # The digest instances for this page of results.
        items:,
        # Always `list` for a paginated list response.
        type:,
        # A cursor token for fetching the next page of results, or null when there are
        # none.
        cursor: nil,
        # The path to fetch the next page of results, or null when there are none.
        next_url: nil,
        # The path of the current request.
        url: nil
      )
      end

      sig do
        override.returns(
          {
            has_more: T::Boolean,
            items: T::Array[Courier::DigestInstance],
            type: Courier::DigestInstanceListResponse::Type::TaggedSymbol,
            cursor: T.nilable(String),
            next_url: T.nilable(String),
            url: String
          }
        )
      end
      def to_hash
      end

      # Always `list` for a paginated list response.
      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::DigestInstanceListResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(:list, Courier::DigestInstanceListResponse::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::DigestInstanceListResponse::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
