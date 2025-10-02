# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      module Types
        class UserPreferencesListResponse < Internal::Types::Model
          field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
          field :items, lambda {
            Internal::Types::Array[Courier::Users::Preferences::Types::TopicPreference]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
