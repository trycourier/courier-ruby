# frozen_string_literal: true

module Courier
  module Send
    module Types
      class WidgetBackground < Internal::Types::Model
        field :top_color, -> { String }, optional: true, nullable: false
        field :bottom_color, -> { String }, optional: true, nullable: false
      end
    end
  end
end
