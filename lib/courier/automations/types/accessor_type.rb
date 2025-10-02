# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AccessorType < Internal::Types::Model
        field :ref, -> { String }, optional: false, nullable: false
      end
    end
  end
end
