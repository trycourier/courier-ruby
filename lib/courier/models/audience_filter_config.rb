# frozen_string_literal: true

module Courier
  module Models
    class AudienceFilterConfig < Courier::Internal::Type::BaseModel
      # @!attribute filters
      #   Array of filter rules (single conditions or nested groups)
      #
      #   @return [Array<Courier::Models::FilterConfig>]
      required :filters, -> { Courier::Internal::Type::ArrayOf[Courier::FilterConfig] }

      # @!attribute operator
      #   The logical operator (AND/OR) combining the rules in `filters`. Required when
      #   `filters` contains more than one rule. If omitted, the top-level `operator`
      #   field on the request is used instead.
      #
      #   @return [Symbol, Courier::Models::AudienceFilterConfig::Operator, nil]
      optional :operator, enum: -> { Courier::AudienceFilterConfig::Operator }

      # @!method initialize(filters:, operator: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::AudienceFilterConfig} for more details.
      #
      #   Filter configuration for audience membership containing an array of filter rules
      #
      #   @param filters [Array<Courier::Models::FilterConfig>] Array of filter rules (single conditions or nested groups)
      #
      #   @param operator [Symbol, Courier::Models::AudienceFilterConfig::Operator] The logical operator (AND/OR) combining the rules in `filters`. Required when `f

      # The logical operator (AND/OR) combining the rules in `filters`. Required when
      # `filters` contains more than one rule. If omitted, the top-level `operator`
      # field on the request is used instead.
      #
      # @see Courier::Models::AudienceFilterConfig#operator
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
