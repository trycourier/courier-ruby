# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class GetSubscriptionForListRequest < Internal::Types::Model
        field :list_id, -> { String }, optional: false, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
