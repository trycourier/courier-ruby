# frozen_string_literal: true

module Courier
  module Models
    class JourneyPublishRequest < Courier::Internal::Type::BaseModel
      # @!attribute version
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(version: nil)
      #   @param version [String]
    end
  end
end
