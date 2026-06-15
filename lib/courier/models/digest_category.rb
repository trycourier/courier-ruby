# frozen_string_literal: true

module Courier
  module Models
    class DigestCategory < Courier::Internal::Type::BaseModel
      # @!attribute category_key
      #   The key that identifies the category within the digest.
      #
      #   @return [String]
      required :category_key, String

      # @!attribute retain
      #   Which events to keep when the number of events exceeds the retention limit for
      #   the category.
      #
      #   @return [Symbol, Courier::Models::DigestCategory::Retain]
      required :retain, enum: -> { Courier::DigestCategory::Retain }

      # @!attribute sort_key
      #   The data key used to order events when `retain` is `highest` or `lowest`.
      #
      #   @return [String, nil]
      optional :sort_key, String

      # @!method initialize(category_key:, retain:, sort_key: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::DigestCategory} for more details.
      #
      #   @param category_key [String] The key that identifies the category within the digest.
      #
      #   @param retain [Symbol, Courier::Models::DigestCategory::Retain] Which events to keep when the number of events exceeds the retention limit for t
      #
      #   @param sort_key [String] The data key used to order events when `retain` is `highest` or `lowest`.

      # Which events to keep when the number of events exceeds the retention limit for
      # the category.
      #
      # @see Courier::Models::DigestCategory#retain
      module Retain
        extend Courier::Internal::Type::Enum

        FIRST = :first
        LAST = :last
        HIGHEST = :highest
        LOWEST = :lowest
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
