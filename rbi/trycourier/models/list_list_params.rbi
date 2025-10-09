# typed: strong

module Trycourier
  module Models
    class ListListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::ListListParams, Trycourier::Internal::AnyHash)
        end

      # A unique identifier that allows for fetching the next page of lists.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # "A pattern used to filter the list items returned. Pattern types supported:
      # exact match on `list_id` or a pattern of one or more pattern parts. you may
      # replace a part with either: `*` to match all parts in that position, or `**` to
      # signify a wildcard `endsWith` pattern match."
      sig { returns(T.nilable(String)) }
      attr_accessor :pattern

      sig do
        params(
          cursor: T.nilable(String),
          pattern: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier that allows for fetching the next page of lists.
        cursor: nil,
        # "A pattern used to filter the list items returned. Pattern types supported:
        # exact match on `list_id` or a pattern of one or more pattern parts. you may
        # replace a part with either: `*` to match all parts in that position, or `**` to
        # signify a wildcard `endsWith` pattern match."
        pattern: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: T.nilable(String),
            pattern: T.nilable(String),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
