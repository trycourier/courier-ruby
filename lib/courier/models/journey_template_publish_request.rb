# frozen_string_literal: true

module Courier
  module Models
    class JourneyTemplatePublishRequest < Courier::Internal::Type::BaseModel
      # @!attribute version
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(version: nil)
      #   Request body for publishing a journey-scoped notification template. Pass
      #   `version` to roll back to a prior version; omit to publish the current draft.
      #
      #   @param version [String]
    end
  end
end
