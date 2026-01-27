# frozen_string_literal: true

module Courier
  module Models
    class EmailHeader < Courier::Internal::Type::BaseModel
      # @!attribute logo
      #
      #   @return [Courier::Models::Logo]
      required :logo, -> { Courier::Logo }

      # @!attribute bar_color
      #
      #   @return [String, nil]
      optional :bar_color, String, api_name: :barColor, nil?: true

      # @!attribute inherit_default
      #
      #   @return [Boolean, nil]
      optional :inherit_default, Courier::Internal::Type::Boolean, api_name: :inheritDefault, nil?: true

      # @!method initialize(logo:, bar_color: nil, inherit_default: nil)
      #   @param logo [Courier::Models::Logo]
      #   @param bar_color [String, nil]
      #   @param inherit_default [Boolean, nil]
    end
  end
end
