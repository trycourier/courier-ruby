# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BaseMessage < Internal::Types::Model
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :brand_id, -> { String }, optional: true, nullable: false
        field :channels, lambda {
          Internal::Types::Hash[String, Courier::Send::Types::Channel]
        }, optional: true, nullable: false
        field :context, -> { Courier::Send::Types::MessageContext }, optional: true, nullable: false
        field :metadata, -> { Courier::Send::Types::MessageMetadata }, optional: true, nullable: false
        field :preferences, -> { Courier::Send::Types::MessagePreferences }, optional: true, nullable: false
        field :providers, lambda {
          Internal::Types::Hash[String, Courier::Send::Types::MessageProvidersType]
        }, optional: true, nullable: false
        field :routing, -> { Courier::Send::Types::Routing }, optional: true, nullable: false
        field :timeout, -> { Courier::Send::Types::Timeout }, optional: true, nullable: false
        field :delay, -> { Courier::Send::Types::Delay }, optional: true, nullable: false
        field :expiry, -> { Courier::Send::Types::Expiry }, optional: true, nullable: false
      end
    end
  end
end
