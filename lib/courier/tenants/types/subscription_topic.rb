# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class SubscriptionTopic < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
