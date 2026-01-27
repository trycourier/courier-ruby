# frozen_string_literal: true

module Courier
  module Models
    class WidgetBackground < Courier::Internal::Type::BaseModel
      # @!attribute bottom_color
      #
      #   @return [String, nil]
      optional :bottom_color, String, api_name: :bottomColor, nil?: true

      # @!attribute top_color
      #
      #   @return [String, nil]
      optional :top_color, String, api_name: :topColor, nil?: true

      # @!method initialize(bottom_color: nil, top_color: nil)
      #   @param bottom_color [String, nil]
      #   @param top_color [String, nil]
    end
  end
end
