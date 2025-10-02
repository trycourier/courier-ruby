# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BrandTemplateOverride < Internal::Types::Model
        field :mjml, -> { Courier::Send::Types::BrandTemplate }, optional: false, nullable: false
        field :footer_background_color, -> { String }, optional: true, nullable: false
        field :footer_full_width, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
