# frozen_string_literal: true

module Trycourier
  module Models
    class EmailHeader < Trycourier::Internal::Type::BaseModel
      # @!attribute logo
      #
      #   @return [Trycourier::Models::Logo]
      required :logo, -> { Trycourier::Logo }

      # @!attribute bar_color
      #
      #   @return [String, nil]
      optional :bar_color, String, api_name: :barColor, nil?: true

      # @!attribute inherit_default
      #
      #   @return [Boolean, nil]
      optional :inherit_default, Trycourier::Internal::Type::Boolean, api_name: :inheritDefault, nil?: true

      # @!method initialize(logo:, bar_color: nil, inherit_default: nil)
      #   @param logo [Trycourier::Models::Logo]
      #   @param bar_color [String, nil]
      #   @param inherit_default [Boolean, nil]
    end
  end
end
