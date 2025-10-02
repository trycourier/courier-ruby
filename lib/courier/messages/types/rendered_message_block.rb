# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class RenderedMessageBlock < Internal::Types::Model
        field :type, -> { String }, optional: false, nullable: false
        field :text, -> { String }, optional: false, nullable: false
      end
    end
  end
end
