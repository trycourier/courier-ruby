# frozen_string_literal: true

module Courier
  module Models
    class TopicDigestCategory < Courier::Internal::Type::BaseModel
      # @!attribute category_key
      #   The key that identifies the category within the digest.
      #
      #   @return [String]
      required :category_key, String

      # @!attribute limit
      #   How many collected events are carried into the rendered digest. Defaults to 10.
      #
      #   Events beyond the limit are discarded, not held back for the next digest: the
      #   release consumes everything collected so far and only `limit` of them appear.
      #   `retain` decides which ones those are.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute retain
      #   Which collected events survive the `limit`. `FIRST` and `LOWEST` keep the
      #   earliest or smallest; `LAST` and `HIGHEST` keep the latest or largest. Accepted
      #   case-insensitively, returned uppercase.
      #
      #   @return [Symbol, Courier::Models::TopicDigestCategory::Retain, nil]
      optional :retain, enum: -> { Courier::TopicDigestCategory::Retain }

      # @!attribute sort_key
      #   The data key used to rank events. Required when `retain` is `HIGHEST` or
      #   `LOWEST`.
      #
      #   @return [String, nil]
      optional :sort_key, String

      # @!method initialize(category_key:, limit: nil, retain: nil, sort_key: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TopicDigestCategory} for more details.
      #
      #   How events collected under a category key are retained when a digest holds more
      #   than it will render.
      #
      #   @param category_key [String] The key that identifies the category within the digest.
      #
      #   @param limit [Integer] How many collected events are carried into the rendered digest. Defaults to 10.
      #
      #   @param retain [Symbol, Courier::Models::TopicDigestCategory::Retain] Which collected events survive the `limit`. `FIRST` and `LOWEST` keep the earlie
      #
      #   @param sort_key [String] The data key used to rank events. Required when `retain` is `HIGHEST` or `LOWEST

      # Which collected events survive the `limit`. `FIRST` and `LOWEST` keep the
      # earliest or smallest; `LAST` and `HIGHEST` keep the latest or largest. Accepted
      # case-insensitively, returned uppercase.
      #
      # @see Courier::Models::TopicDigestCategory#retain
      module Retain
        extend Courier::Internal::Type::Enum

        FIRST = :FIRST
        LAST = :LAST
        HIGHEST = :HIGHEST
        LOWEST = :LOWEST
        NONE = :NONE

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
