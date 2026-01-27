# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Audiences#update
    class AudienceUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute description
      #   A description of the audience
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute filter
      #   Filter configuration for audience membership containing an array of filter rules
      #
      #   @return [Courier::Models::AudienceFilterConfig, nil]
      optional :filter, -> { Courier::AudienceFilterConfig }, nil?: true

      # @!attribute name
      #   The name of the audience
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute operator
      #   The logical operator (AND/OR) for the top-level filter
      #
      #   @return [Symbol, Courier::Models::AudienceUpdateParams::Operator, nil]
      optional :operator, enum: -> { Courier::AudienceUpdateParams::Operator }, nil?: true

      # @!method initialize(description: nil, filter: nil, name: nil, operator: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::AudienceUpdateParams} for more details.
      #
      #   @param description [String, nil] A description of the audience
      #
      #   @param filter [Courier::Models::AudienceFilterConfig, nil] Filter configuration for audience membership containing an array of filter rules
      #
      #   @param name [String, nil] The name of the audience
      #
      #   @param operator [Symbol, Courier::Models::AudienceUpdateParams::Operator, nil] The logical operator (AND/OR) for the top-level filter
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      # The logical operator (AND/OR) for the top-level filter
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
