# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::WorkspacePreferences#list
    class WorkspacePreferenceListResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Courier::Models::WorkspacePreferenceGetResponse>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::WorkspacePreferenceGetResponse] }

      # @!method initialize(results:)
      #   The workspace's preferences, each with its topics.
      #
      #   @param results [Array<Courier::Models::WorkspacePreferenceGetResponse>]
    end
  end
end
