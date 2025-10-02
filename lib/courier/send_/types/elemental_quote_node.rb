# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Renders a quote block.
      class ElementalQuoteNode < Internal::Types::Model
        field :content, -> { String }, optional: false, nullable: false
        field :align, -> { Courier::Send::Types::IAlignment }, optional: true, nullable: false
        field :border_color, -> { String }, optional: true, nullable: false
        field :text_style, -> { Courier::Send::Types::TextStyle }, optional: false, nullable: false
        field :locales, lambda {
          Internal::Types::Hash[String, Courier::Send::Types::Locale]
        }, optional: false, nullable: false
      end
    end
  end
end
