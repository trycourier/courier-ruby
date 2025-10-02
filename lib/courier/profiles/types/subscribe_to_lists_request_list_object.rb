# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SubscribeToListsRequestListObject < Internal::Types::Model
        field :list_id, -> { String }, optional: false, nullable: false
        field :preferences, -> { Courier::Commons::Types::RecipientPreferences }, optional: true, nullable: false
      end
    end
  end
end
