# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      # A single filter to use for filtering
      class SingleFilterConfig < Internal::Types::Model
        field :value, -> { String }, optional: false, nullable: false
        field :path, -> { String }, optional: false, nullable: false
      end
    end
  end
end
