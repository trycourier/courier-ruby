# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Allows you to customize which channel(s) Courier will potentially deliver the message.
      # If no routing key is specified, Courier will use the default routing configuration or
      # routing defined by the template.
      class Routing < Internal::Types::Model
        field :method_, -> { Courier::Send::Types::RoutingMethod }, optional: false, nullable: false
        field :channels, lambda {
          Internal::Types::Array[Courier::Notifications::Types::MessageRoutingChannel]
        }, optional: false, nullable: false
      end
    end
  end
end
