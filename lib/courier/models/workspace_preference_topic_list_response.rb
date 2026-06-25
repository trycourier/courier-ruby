# frozen_string_literal: true

module Courier
  module Models
    class WorkspacePreferenceTopicListResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Courier::Models::WorkspacePreferenceTopicGetResponse>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::WorkspacePreferenceTopicGetResponse] }

      # @!method initialize(results:)
      #   Topics contained in a workspace preference.
      #
      #   @param results [Array<Courier::Models::WorkspacePreferenceTopicGetResponse>]
    end
  end
end
