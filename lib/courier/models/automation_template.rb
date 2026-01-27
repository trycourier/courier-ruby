# frozen_string_literal: true

module Courier
  module Models
    class AutomationTemplate < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The unique identifier of the automation template.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   The name of the automation template.
      #
      #   @return [String]
      required :name, String

      # @!attribute version
      #   The version of the template published or drafted.
      #
      #   @return [Symbol, Courier::Models::AutomationTemplate::Version]
      required :version, enum: -> { Courier::AutomationTemplate::Version }

      # @!attribute created_at
      #   ISO 8601 timestamp when the template was created.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute updated_at
      #   ISO 8601 timestamp when the template was last updated.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, name:, version:, created_at: nil, updated_at: nil)
      #   @param id [String] The unique identifier of the automation template.
      #
      #   @param name [String] The name of the automation template.
      #
      #   @param version [Symbol, Courier::Models::AutomationTemplate::Version] The version of the template published or drafted.
      #
      #   @param created_at [Time] ISO 8601 timestamp when the template was created.
      #
      #   @param updated_at [Time] ISO 8601 timestamp when the template was last updated.

      # The version of the template published or drafted.
      #
      # @see Courier::Models::AutomationTemplate#version
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
