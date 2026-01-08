# frozen_string_literal: true

module Trycourier
  module Models
    class AutomationTemplate < Trycourier::Internal::Type::BaseModel
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
      #   The version of the template published, draft.
      #
      #   @return [Symbol, Trycourier::Models::AutomationTemplate::Version]
      required :version, enum: -> { Trycourier::AutomationTemplate::Version }

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
      #   @param version [Symbol, Trycourier::Models::AutomationTemplate::Version] The version of the template published, draft.
      #
      #   @param created_at [Time] ISO 8601 timestamp when the template was created.
      #
      #   @param updated_at [Time] ISO 8601 timestamp when the template was last updated.

      # The version of the template published, draft.
      #
      # @see Trycourier::Models::AutomationTemplate#version
      module Version
        extend Trycourier::Internal::Type::Enum

        PUBLISHED = :published
        DRAFT = :draft

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
