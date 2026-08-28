# frozen_string_literal: true

module Courier
  module Models
    class ElementalDividerNode < Courier::Models::ElementalBaseNode
      # @!attribute color
      #   The CSS color to render the line with. For example, `#fff`
      #
      #   @return [String, nil]
      optional :color, String, nil?: true

      # @!method initialize(color: nil)
      #   Renders a dividing line between elements.
      #
      #   @param color [String, nil] The CSS color to render the line with. For example, `#fff`
    end
  end
end
