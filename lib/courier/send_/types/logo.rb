# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Logo < Internal::Types::Model
        field :href, -> { String }, optional: true, nullable: false
        field :image, -> { String }, optional: true, nullable: false
      end
    end
  end
end
