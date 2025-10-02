# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Expiry < Internal::Types::Model
        field :expires_at, -> { String }, optional: true, nullable: false
        field :expires_in, -> { Courier::Send::Types::ExpiresInType }, optional: false, nullable: false
      end
    end
  end
end
