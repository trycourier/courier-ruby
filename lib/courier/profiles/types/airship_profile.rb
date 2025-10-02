# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class AirshipProfile < Internal::Types::Model
        field :audience, -> { Courier::Profiles::Types::AirshipProfileAudience }, optional: false, nullable: false
        field :device_types, lambda {
          Internal::Types::Array[Internal::Types::Hash[String, Object]]
        }, optional: false, nullable: false
      end
    end
  end
end
