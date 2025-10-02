# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class BaseError < Internal::Types::Model
        field :message, -> { String }, optional: false, nullable: false
      end
    end
  end
end
