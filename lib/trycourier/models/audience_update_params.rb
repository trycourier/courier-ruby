# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Audiences#update
    class AudienceUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute description
      #   A description of the audience
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute filter
      #   Filter that contains an array of FilterConfig items
      #
      #   @return [Trycourier::Models::Filter, nil]
      optional :filter, -> { Trycourier::Filter }, nil?: true

      # @!attribute name
      #   The name of the audience
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute operator
      #   The logical operator (AND/OR) for the top-level filter
      #
      #   @return [Symbol, Trycourier::Models::AudienceUpdateParams::Operator, nil]
      optional :operator, enum: -> { Trycourier::AudienceUpdateParams::Operator }, nil?: true

      # @!method initialize(description: nil, filter: nil, name: nil, operator: nil, request_options: {})
      #   @param description [String, nil] A description of the audience
      #
      #   @param filter [Trycourier::Models::Filter, nil] Filter that contains an array of FilterConfig items
      #
      #   @param name [String, nil] The name of the audience
      #
      #   @param operator [Symbol, Trycourier::Models::AudienceUpdateParams::Operator, nil] The logical operator (AND/OR) for the top-level filter
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]

      # The logical operator (AND/OR) for the top-level filter
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
