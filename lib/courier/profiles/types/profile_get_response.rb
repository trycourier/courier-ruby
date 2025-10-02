# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class ProfileGetResponse < Internal::Types::Model
        field :profile, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: false, nullable: false
        field :preferences, -> { Courier::Commons::Types::RecipientPreferences }, optional: true, nullable: false
      end
    end
  end
end
