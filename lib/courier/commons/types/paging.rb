# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class Paging < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :more, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
