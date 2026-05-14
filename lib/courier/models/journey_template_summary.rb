# frozen_string_literal: true

module Courier
  module Models
    class JourneyTemplateSummary < Courier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute creator
      #
      #   @return [String]
      required :creator, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute state
      #
      #   @return [String]
      required :state, String

      # @!attribute tags
      #
      #   @return [Array<String>]
      required :tags, Courier::Internal::Type::ArrayOf[String]

      # @!attribute updated
      #
      #   @return [Integer, nil]
      optional :updated, Integer

      # @!attribute updater
      #
      #   @return [String, nil]
      optional :updater, String

      # @!method initialize(id:, created:, creator:, name:, state:, tags:, updated: nil, updater: nil)
      #   @param id [String]
      #   @param created [Integer]
      #   @param creator [String]
      #   @param name [String]
      #   @param state [String]
      #   @param tags [Array<String>]
      #   @param updated [Integer]
      #   @param updater [String]
    end
  end
end
