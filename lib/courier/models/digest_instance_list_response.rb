# frozen_string_literal: true

module Courier
  module Models
    class DigestInstanceListResponse < Courier::Internal::Type::BaseModel
      # @!attribute has_more
      #   Whether there are more digest instances to fetch using the cursor.
      #
      #   @return [Boolean]
      required :has_more, Courier::Internal::Type::Boolean

      # @!attribute items
      #   The digest instances for this page of results.
      #
      #   @return [Array<Courier::Models::DigestInstance>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::DigestInstance] }

      # @!attribute type
      #   Always `list` for a paginated list response.
      #
      #   @return [Symbol, Courier::Models::DigestInstanceListResponse::Type]
      required :type, enum: -> { Courier::DigestInstanceListResponse::Type }

      # @!attribute cursor
      #   A cursor token for fetching the next page of results, or null when there are
      #   none.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute next_url
      #   The path to fetch the next page of results, or null when there are none.
      #
      #   @return [String, nil]
      optional :next_url, String, nil?: true

      # @!attribute url
      #   The path of the current request.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(has_more:, items:, type:, cursor: nil, next_url: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::DigestInstanceListResponse} for more details.
      #
      #   @param has_more [Boolean] Whether there are more digest instances to fetch using the cursor.
      #
      #   @param items [Array<Courier::Models::DigestInstance>] The digest instances for this page of results.
      #
      #   @param type [Symbol, Courier::Models::DigestInstanceListResponse::Type] Always `list` for a paginated list response.
      #
      #   @param cursor [String, nil] A cursor token for fetching the next page of results, or null when there are non
      #
      #   @param next_url [String, nil] The path to fetch the next page of results, or null when there are none.
      #
      #   @param url [String] The path of the current request.

      # Always `list` for a paginated list response.
      #
      # @see Courier::Models::DigestInstanceListResponse#type
      module Type
        extend Courier::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
