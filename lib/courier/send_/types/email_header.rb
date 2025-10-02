# frozen_string_literal: true

module Courier
  module Send
    module Types
      class EmailHeader < Internal::Types::Model
        field :inherit_default, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :bar_color, -> { String }, optional: true, nullable: false
        field :logo, -> { Courier::Send::Types::Logo }, optional: false, nullable: false
      end
    end
  end
end
