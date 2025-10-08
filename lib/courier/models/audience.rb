# frozen_string_literal: true

module Courier
  module Models
    class Audience < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier representing the audience_id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [String]
      required :created_at, String

      # @!attribute description
      #   A description of the audience
      #
      #   @return [String]
      required :description, String

      # @!attribute filter
      #   A single filter to use for filtering
      #
      #   @return [Courier::Models::Filter]
      required :filter, -> { Courier::Filter }

      # @!attribute name
      #   The name of the audience
      #
      #   @return [String]
      required :name, String

      # @!attribute updated_at
      #
      #   @return [String]
      required :updated_at, String

      # @!method initialize(id:, created_at:, description:, filter:, name:, updated_at:)
      #   @param id [String] A unique identifier representing the audience_id
      #
      #   @param created_at [String]
      #
      #   @param description [String] A description of the audience
      #
      #   @param filter [Courier::Models::Filter] A single filter to use for filtering
      #
      #   @param name [String] The name of the audience
      #
      #   @param updated_at [String]
    end
  end
end
