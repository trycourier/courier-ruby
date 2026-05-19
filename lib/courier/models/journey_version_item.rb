# frozen_string_literal: true

module Courier
  module Models
    class JourneyVersionItem < Courier::Internal::Type::BaseModel
      # @!attribute created
      #
      #   @return [Integer, nil]
      required :created, Integer, nil?: true

      # @!attribute creator
      #
      #   @return [String, nil]
      required :creator, String, nil?: true

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute published
      #
      #   @return [Integer, nil]
      required :published, Integer, nil?: true

      # @!attribute version
      #
      #   @return [String]
      required :version, String

      # @!method initialize(created:, creator:, name:, published:, version:)
      #   A published version of a journey.
      #
      #   @param created [Integer, nil]
      #   @param creator [String, nil]
      #   @param name [String]
      #   @param published [Integer, nil]
      #   @param version [String]
    end
  end
end
