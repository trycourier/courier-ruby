# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class Conflict < Internal::Types::Model
        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end
