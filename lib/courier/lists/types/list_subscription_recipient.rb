# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class ListSubscriptionRecipient < Internal::Types::Model
        field :recipient_id, -> { String }, optional: false, nullable: false
        field :created, -> { String }, optional: true, nullable: false
        field :preferences, -> { Courier::Commons::Types::RecipientPreferences }, optional: true, nullable: false
      end
    end
  end
end
