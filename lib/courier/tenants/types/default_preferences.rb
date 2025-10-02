# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class DefaultPreferences < Internal::Types::Model
        field :items, lambda {
          Internal::Types::Array[Courier::Tenants::Types::SubscriptionTopic]
        }, optional: true, nullable: false
      end
    end
  end
end
