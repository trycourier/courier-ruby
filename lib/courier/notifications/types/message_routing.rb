# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class MessageRouting < Internal::Types::Model
        field :method_, -> { Courier::Notifications::Types::MessageRoutingMethod }, optional: false, nullable: false
        field :channels, lambda {
          Internal::Types::Array[Courier::Notifications::Types::MessageRoutingChannel]
        }, optional: false, nullable: false
      end
    end
  end
end
