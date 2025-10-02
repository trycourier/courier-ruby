# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class GetAllListsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :pattern, -> { String }, optional: true, nullable: false
      end
    end
  end
end
