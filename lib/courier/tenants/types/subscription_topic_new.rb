# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class SubscriptionTopicNew < Internal::Types::Model
        field :status, -> { Courier::Tenants::Types::SubscriptionTopicStatus }, optional: false, nullable: false
        field :has_custom_routing, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :custom_routing, lambda {
          Internal::Types::Array[Courier::Commons::Types::ChannelClassification]
        }, optional: true, nullable: false
      end
    end
  end
end
