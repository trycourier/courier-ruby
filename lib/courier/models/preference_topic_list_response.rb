# frozen_string_literal: true

module Courier
  module Models
    class PreferenceTopicListResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Courier::Models::PreferenceTopicGetResponse>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::PreferenceTopicGetResponse] }

      # @!method initialize(results:)
      #   Topics contained in a preference section.
      #
      #   @param results [Array<Courier::Models::PreferenceTopicGetResponse>]
    end
  end
end
