# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class RecipientPreferences < Internal::Types::Model
        field :categories, lambda {
          Internal::Types::Hash[String, Courier::Commons::Types::NotificationPreferenceDetails]
        }, optional: true, nullable: false
        field :notifications, lambda {
          Internal::Types::Hash[String, Courier::Commons::Types::NotificationPreferenceDetails]
        }, optional: true, nullable: false
      end
    end
  end
end
