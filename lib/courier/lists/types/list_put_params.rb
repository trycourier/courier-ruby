# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class ListPutParams < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :preferences, -> { Courier::Commons::Types::RecipientPreferences }, optional: true, nullable: false
      end
    end
  end
end
