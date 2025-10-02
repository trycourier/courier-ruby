# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class AddSubscribersToList < Internal::Types::Model
        field :list_id, -> { String }, optional: false, nullable: false
        field :recipients, lambda {
          Internal::Types::Array[Courier::Lists::Types::PutSubscriptionsRecipient]
        }, optional: false, nullable: false
      end
    end
  end
end
