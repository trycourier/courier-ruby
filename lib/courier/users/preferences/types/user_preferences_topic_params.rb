# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      module Types
        class UserPreferencesTopicParams < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :topic_id, -> { String }, optional: false, nullable: false
          field :tenant_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
