# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class BrandSettings < Internal::Types::Model
        field :colors, -> { Courier::Brands::Types::BrandColors }, optional: true, nullable: false
        field :inapp, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :email, -> { Courier::Commons::Types::Email }, optional: true, nullable: false
      end
    end
  end
end
