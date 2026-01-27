# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Audiences#retrieve
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

      # @!attribute name
      #   The name of the audience
      #
      #   @return [String]
      required :name, String

      # @!attribute updated_at
      #
      #   @return [String]
      required :updated_at, String

      # @!attribute filter
      #   Filter configuration for audience membership containing an array of filter rules
      #
      #   @return [Courier::Models::AudienceFilterConfig, nil]
      optional :filter, -> { Courier::AudienceFilterConfig }, nil?: true

      # @!attribute operator
      #   The logical operator (AND/OR) for the top-level filter
      #
      #   @return [Symbol, Courier::Models::Audience::Operator, nil]
      optional :operator, enum: -> { Courier::Audience::Operator }

      # @!method initialize(id:, created_at:, description:, name:, updated_at:, filter: nil, operator: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::Audience} for more details.
      #
      #   @param id [String] A unique identifier representing the audience_id
      #
      #   @param created_at [String]
      #
      #   @param description [String] A description of the audience
      #
      #   @param name [String] The name of the audience
      #
      #   @param updated_at [String]
      #
      #   @param filter [Courier::Models::AudienceFilterConfig, nil] Filter configuration for audience membership containing an array of filter rules
      #
      #   @param operator [Symbol, Courier::Models::Audience::Operator] The logical operator (AND/OR) for the top-level filter

      # The logical operator (AND/OR) for the top-level filter
      #
      # @see Courier::Models::Audience#operator
      module Operator
        extend Courier::Internal::Type::Enum

        AND = :AND
        OR = :OR

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
