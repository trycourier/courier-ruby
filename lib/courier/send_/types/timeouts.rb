# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Timeouts < Internal::Types::Model
        field :provider, -> { Integer }, optional: true, nullable: false
        field :channel, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
