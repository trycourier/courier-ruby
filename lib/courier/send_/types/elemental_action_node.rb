# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Allows the user to execute an action. Can be a button or a link.
      class ElementalActionNode < Internal::Types::Model
        field :content, -> { String }, optional: false, nullable: false
        field :href, -> { String }, optional: false, nullable: false
        field :action_id, -> { String }, optional: true, nullable: false
        field :align, -> { Courier::Send::Types::IAlignment }, optional: true, nullable: false
        field :background_color, -> { String }, optional: true, nullable: false
        field :style, -> { Courier::Send::Types::IActionButtonStyle }, optional: true, nullable: false
        field :locales, lambda {
          Internal::Types::Hash[String, Courier::Send::Types::Locale]
        }, optional: false, nullable: false
      end
    end
  end
end
