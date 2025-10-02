# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      module Types
        class UserPreferencesUpdateResponse < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
