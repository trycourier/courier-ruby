# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class ListGetSubscriptionsResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :items, lambda {
          Internal::Types::Array[Courier::Lists::Types::ListSubscriptionRecipient]
        }, optional: false, nullable: false
      end
    end
  end
end
