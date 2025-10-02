# frozen_string_literal: true

module Courier
  module Templates
    module Types
      class RoutingStrategy < Internal::Types::Model
        field :method_, -> { Courier::Templates::Types::RoutingStrategyMethod }, optional: false, nullable: false
        field :channels, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
