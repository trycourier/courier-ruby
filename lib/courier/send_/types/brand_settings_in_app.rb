# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BrandSettingsInApp < Internal::Types::Model
        field :border_radius, -> { String }, optional: true, nullable: false
        field :disable_message_icon, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :font_family, -> { String }, optional: true, nullable: false
        field :placement, -> { Courier::Send::Types::InAppPlacement }, optional: true, nullable: false
        field :widget_background, -> { Courier::Send::Types::WidgetBackground }, optional: false, nullable: false
        field :colors, -> { Courier::Brands::Types::BrandColors }, optional: false, nullable: false
        field :icons, -> { Courier::Send::Types::Icons }, optional: false, nullable: false
        field :preferences, -> { Courier::Send::Types::Preferences }, optional: false, nullable: false
      end
    end
  end
end
