# frozen_string_literal: true

module Courier
  module Send
    module Types
      class EmailHead < Internal::Types::Model
        field :inherit_default, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :content, -> { String }, optional: true, nullable: false
      end
    end
  end
end
