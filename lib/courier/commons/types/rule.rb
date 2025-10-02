# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class Rule < Internal::Types::Model
        field :start, -> { String }, optional: true, nullable: false
        field :until_, -> { String }, optional: false, nullable: false
      end
    end
  end
end
