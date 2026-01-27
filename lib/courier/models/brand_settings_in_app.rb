# frozen_string_literal: true

module Courier
  module Models
    class BrandSettingsInApp < Courier::Internal::Type::BaseModel
      # @!attribute colors
      #
      #   @return [Courier::Models::BrandColors]
      required :colors, -> { Courier::BrandColors }

      # @!attribute icons
      #
      #   @return [Courier::Models::Icons]
      required :icons, -> { Courier::Icons }

      # @!attribute widget_background
      #
      #   @return [Courier::Models::WidgetBackground]
      required :widget_background, -> { Courier::WidgetBackground }, api_name: :widgetBackground

      # @!attribute border_radius
      #
      #   @return [String, nil]
      optional :border_radius, String, api_name: :borderRadius, nil?: true

      # @!attribute disable_message_icon
      #
      #   @return [Boolean, nil]
      optional :disable_message_icon,
               Courier::Internal::Type::Boolean,
               api_name: :disableMessageIcon,
               nil?: true

      # @!attribute font_family
      #
      #   @return [String, nil]
      optional :font_family, String, api_name: :fontFamily, nil?: true

      # @!attribute placement
      #
      #   @return [Symbol, Courier::Models::BrandSettingsInApp::Placement, nil]
      optional :placement, enum: -> { Courier::BrandSettingsInApp::Placement }, nil?: true

      # @!method initialize(colors:, icons:, widget_background:, border_radius: nil, disable_message_icon: nil, font_family: nil, placement: nil)
      #   @param colors [Courier::Models::BrandColors]
      #   @param icons [Courier::Models::Icons]
      #   @param widget_background [Courier::Models::WidgetBackground]
      #   @param border_radius [String, nil]
      #   @param disable_message_icon [Boolean, nil]
      #   @param font_family [String, nil]
      #   @param placement [Symbol, Courier::Models::BrandSettingsInApp::Placement, nil]

      # @see Courier::Models::BrandSettingsInApp#placement
      module Placement
        extend Courier::Internal::Type::Enum

        TOP = :top
        BOTTOM = :bottom
        LEFT = :left
        RIGHT = :right

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
