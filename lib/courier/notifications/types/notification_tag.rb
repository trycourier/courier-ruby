# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationTag < Internal::Types::Model
        field :data, lambda {
          Internal::Types::Array[Courier::Notifications::Types::NotificationTagData]
        }, optional: false, nullable: false
      end
    end
  end
end
