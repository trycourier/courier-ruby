# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      module Types
        class UserPreferencesGetResponse < Internal::Types::Model
          field :topic, -> { Courier::Users::Preferences::Types::TopicPreference }, optional: false, nullable: false
        end
      end
    end
  end
end
