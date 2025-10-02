# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      module Types
        class TopicPreference < Internal::Types::Model
          field :custom_routing, lambda {
            Internal::Types::Array[Courier::Commons::Types::ChannelClassification]
          }, optional: true, nullable: false
          field :default_status, -> { Courier::Commons::Types::PreferenceStatus }, optional: false, nullable: false
          field :has_custom_routing, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :status, -> { Courier::Commons::Types::PreferenceStatus }, optional: false, nullable: false
          field :topic_id, -> { String }, optional: false, nullable: false
          field :topic_name, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
