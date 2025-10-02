# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class Check < Internal::Types::Model
        field :updated, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
