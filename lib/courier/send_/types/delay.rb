# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Delay < Internal::Types::Model
        field :duration, -> { Integer }, optional: true, nullable: false
        field :until_, -> { String }, optional: true, nullable: false
      end
    end
  end
end
