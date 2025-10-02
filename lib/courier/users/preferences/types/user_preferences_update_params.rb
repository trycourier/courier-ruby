# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      module Types
        class UserPreferencesUpdateParams < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :topic_id, -> { String }, optional: false, nullable: false
          field :tenant_id, -> { String }, optional: true, nullable: false
          field :topic, lambda {
            Courier::Users::Preferences::Types::TopicPreferenceUpdate
          }, optional: false, nullable: false
        end
      end
    end
  end
end
