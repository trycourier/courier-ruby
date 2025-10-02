# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class GetListSubscriptionsList < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :created, -> { String }, optional: false, nullable: false
        field :updated, -> { String }, optional: false, nullable: false
        field :preferences, -> { Courier::Commons::Types::RecipientPreferences }, optional: true, nullable: false
      end
    end
  end
end
