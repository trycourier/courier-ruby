# frozen_string_literal: true

module Courier
  module Models
    class Journey < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The unique identifier of the journey.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   The name of the journey.
      #
      #   @return [String]
      required :name, String

      # @!attribute version
      #   The version of the journey (published or draft).
      #
      #   @return [Symbol, Courier::Models::Journey::Version]
      required :version, enum: -> { Courier::Journey::Version }

      # @!attribute created_at
      #   ISO 8601 timestamp when the journey was created.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute updated_at
      #   ISO 8601 timestamp when the journey was last updated.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, name:, version:, created_at: nil, updated_at: nil)
      #   A journey template representing an automation workflow.
      #
      #   @param id [String] The unique identifier of the journey.
      #
      #   @param name [String] The name of the journey.
      #
      #   @param version [Symbol, Courier::Models::Journey::Version] The version of the journey (published or draft).
      #
      #   @param created_at [Time] ISO 8601 timestamp when the journey was created.
      #
      #   @param updated_at [Time] ISO 8601 timestamp when the journey was last updated.

      # The version of the journey (published or draft).
      #
      # @see Courier::Models::Journey#version
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
