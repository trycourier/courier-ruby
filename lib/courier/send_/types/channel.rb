# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Channel < Internal::Types::Model
        field :brand_id, -> { String }, optional: true, nullable: false
        field :providers, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :routing_method, -> { Courier::Send::Types::RoutingMethod }, optional: true, nullable: false
        field :if_, -> { String }, optional: true, nullable: false
        field :timeouts, -> { Courier::Send::Types::Timeouts }, optional: true, nullable: false
        field :override, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :metadata, -> { Courier::Send::Types::ChannelMetadata }, optional: true, nullable: false
      end
    end
  end
end
