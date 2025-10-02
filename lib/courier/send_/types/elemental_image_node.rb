# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Used to embed an image into the notification.
      class ElementalImageNode < Internal::Types::Model
        field :src, -> { String }, optional: false, nullable: false
        field :href, -> { String }, optional: true, nullable: false
        field :align, -> { Courier::Send::Types::IAlignment }, optional: true, nullable: false
        field :alt_text, -> { String }, optional: true, nullable: false
        field :width, -> { String }, optional: true, nullable: false
      end
    end
  end
end
