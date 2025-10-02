# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class NotificationPreferenceDetails < Internal::Types::Model
        field :status, -> { Courier::Commons::Types::PreferenceStatus }, optional: false, nullable: false
        field :rules, -> { Internal::Types::Array[Courier::Commons::Types::Rule] }, optional: true, nullable: false
        field :channel_preferences, lambda {
          Internal::Types::Array[Courier::Commons::Types::ChannelPreference]
        }, optional: true, nullable: false
      end
    end
  end
end
