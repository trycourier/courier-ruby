# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Represents a body of text to be rendered inside of the notification.
      class ElementalTextNode < Internal::Types::Model
        field :content, -> { String }, optional: false, nullable: false
        field :align, -> { Courier::Send::Types::TextAlign }, optional: false, nullable: false
        field :text_style, -> { Courier::Send::Types::TextStyle }, optional: true, nullable: false
        field :color, -> { String }, optional: true, nullable: false
        field :bold, -> { String }, optional: true, nullable: false
        field :italic, -> { String }, optional: true, nullable: false
        field :strikethrough, -> { String }, optional: true, nullable: false
        field :underline, -> { String }, optional: true, nullable: false
        field :locales, lambda {
          Internal::Types::Hash[String, Courier::Send::Types::Locale]
        }, optional: true, nullable: false
        field :format, -> { String }, optional: true, nullable: false
      end
    end
  end
end
