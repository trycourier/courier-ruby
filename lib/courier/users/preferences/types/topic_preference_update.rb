# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      module Types
        class TopicPreferenceUpdate < Internal::Types::Model
          field :status, -> { Courier::Commons::Types::PreferenceStatus }, optional: false, nullable: false
          field :custom_routing, lambda {
            Internal::Types::Array[Courier::Commons::Types::ChannelClassification]
          }, optional: true, nullable: false
          field :has_custom_routing, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
