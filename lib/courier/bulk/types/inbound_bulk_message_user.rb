# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class InboundBulkMessageUser < Internal::Types::Model
        field :preferences, -> { Courier::Commons::Types::RecipientPreferences }, optional: true, nullable: false
        field :profile, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :recipient, -> { String }, optional: true, nullable: false
        field :data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :to, -> { Courier::Send::Types::UserRecipient }, optional: true, nullable: false
      end
    end
  end
end
