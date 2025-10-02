# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class UserToken < Internal::Types::Model
          field :token, -> { String }, optional: true, nullable: false
          field :provider_key, -> { Courier::Users::Tokens::Types::ProviderKey }, optional: false, nullable: false
          field :expiry_date, -> { Courier::Users::Tokens::Types::ExpiryDate }, optional: true, nullable: false
          field :properties, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
          field :device, -> { Courier::Users::Tokens::Types::Device }, optional: true, nullable: false
          field :tracking, -> { Courier::Users::Tokens::Types::Tracking }, optional: true, nullable: false
        end
      end
    end
  end
end
