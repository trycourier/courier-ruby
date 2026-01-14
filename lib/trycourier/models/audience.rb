# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Audiences#retrieve
    class Audience < Trycourier::Internal::Type::BaseModel
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
      #   @return [Trycourier::Models::AudienceFilterConfig, nil]
      optional :filter, -> { Trycourier::AudienceFilterConfig }, nil?: true

      # @!attribute operator
      #   The logical operator (AND/OR) for the top-level filter
      #
      #   @return [Symbol, Trycourier::Models::Audience::Operator, nil]
      optional :operator, enum: -> { Trycourier::Audience::Operator }

      # @!method initialize(id:, created_at:, description:, name:, updated_at:, filter: nil, operator: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::Audience} for more details.
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
      #   @param filter [Trycourier::Models::AudienceFilterConfig, nil] Filter configuration for audience membership containing an array of filter rules
      #
      #   @param operator [Symbol, Trycourier::Models::Audience::Operator] The logical operator (AND/OR) for the top-level filter

      # The logical operator (AND/OR) for the top-level filter
      #
      # @see Trycourier::Models::Audience#operator
      module Operator
        extend Trycourier::Internal::Type::Enum

        AND = :AND
        OR = :OR

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
