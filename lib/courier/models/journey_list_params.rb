# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#list
    class JourneyListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   A cursor token for pagination. Use the cursor from the previous response to
      #   fetch the next page of results.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute version
      #   The version of journeys to retrieve. Accepted values are published (for
      #   published journeys) or draft (for draft journeys). Defaults to published.
      #
      #   @return [Symbol, Courier::Models::JourneyListParams::Version, nil]
      optional :version, enum: -> { Courier::JourneyListParams::Version }

      # @!method initialize(cursor: nil, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyListParams} for more details.
      #
      #   @param cursor [String] A cursor token for pagination. Use the cursor from the previous response to fetc
      #
      #   @param version [Symbol, Courier::Models::JourneyListParams::Version] The version of journeys to retrieve. Accepted values are published (for publishe
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      # The version of journeys to retrieve. Accepted values are published (for
      # published journeys) or draft (for draft journeys). Defaults to published.
      module Version
        extend Courier::Internal::Type::Enum

        PUBLISHED = :published
        DRAFT = :draft

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
