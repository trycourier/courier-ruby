# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationListResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :results, lambda {
          Internal::Types::Array[Courier::Notifications::Types::Notification]
        }, optional: false, nullable: false
      end
    end
  end
end
