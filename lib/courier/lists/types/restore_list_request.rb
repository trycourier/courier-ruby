# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class RestoreListRequest < Internal::Types::Model
        field :list_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
