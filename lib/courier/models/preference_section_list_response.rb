# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::PreferenceSections#list
    class PreferenceSectionListResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Courier::Models::PreferenceSectionGetResponse>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::PreferenceSectionGetResponse] }

      # @!method initialize(results:)
      #   The workspace's preference sections, each with its topics.
      #
      #   @param results [Array<Courier::Models::PreferenceSectionGetResponse>]
    end
  end
end
