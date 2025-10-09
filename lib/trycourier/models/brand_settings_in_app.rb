# frozen_string_literal: true

module Trycourier
  module Models
    class BrandSettingsInApp < Trycourier::Internal::Type::BaseModel
      # @!attribute colors
      #
      #   @return [Trycourier::Models::BrandColors]
      required :colors, -> { Trycourier::BrandColors }

      # @!attribute icons
      #
      #   @return [Trycourier::Models::Icons]
      required :icons, -> { Trycourier::Icons }

      # @!attribute widget_background
      #
      #   @return [Trycourier::Models::WidgetBackground]
      required :widget_background, -> { Trycourier::WidgetBackground }, api_name: :widgetBackground

      # @!attribute border_radius
      #
      #   @return [String, nil]
      optional :border_radius, String, api_name: :borderRadius, nil?: true

      # @!attribute disable_message_icon
      #
      #   @return [Boolean, nil]
      optional :disable_message_icon,
               Trycourier::Internal::Type::Boolean,
               api_name: :disableMessageIcon,
               nil?: true

      # @!attribute font_family
      #
      #   @return [String, nil]
      optional :font_family, String, api_name: :fontFamily, nil?: true

      # @!attribute placement
      #
      #   @return [Symbol, Trycourier::Models::BrandSettingsInApp::Placement, nil]
      optional :placement, enum: -> { Trycourier::BrandSettingsInApp::Placement }, nil?: true

      # @!method initialize(colors:, icons:, widget_background:, border_radius: nil, disable_message_icon: nil, font_family: nil, placement: nil)
      #   @param colors [Trycourier::Models::BrandColors]
      #   @param icons [Trycourier::Models::Icons]
      #   @param widget_background [Trycourier::Models::WidgetBackground]
      #   @param border_radius [String, nil]
      #   @param disable_message_icon [Boolean, nil]
      #   @param font_family [String, nil]
      #   @param placement [Symbol, Trycourier::Models::BrandSettingsInApp::Placement, nil]

      # @see Trycourier::Models::BrandSettingsInApp#placement
      module Placement
        extend Trycourier::Internal::Type::Enum

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
