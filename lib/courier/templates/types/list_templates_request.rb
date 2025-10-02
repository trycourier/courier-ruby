# frozen_string_literal: true

module Courier
  module Templates
    module Types
      class ListTemplatesRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
