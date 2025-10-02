# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class Address < Internal::Types::Model
        field :formatted, -> { String }, optional: false, nullable: false
        field :street_address, -> { String }, optional: false, nullable: false
        field :locality, -> { String }, optional: false, nullable: false
        field :region, -> { String }, optional: false, nullable: false
        field :postal_code, -> { String }, optional: false, nullable: false
        field :country, -> { String }, optional: false, nullable: false
      end
    end
  end
end
