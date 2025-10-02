# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class PutSubscriptionsRecipient < Internal::Types::Model
        field :recipient_id, -> { String }, optional: false, nullable: false
        field :preferences, -> { Courier::Commons::Types::RecipientPreferences }, optional: true, nullable: false
      end
    end
  end
end
