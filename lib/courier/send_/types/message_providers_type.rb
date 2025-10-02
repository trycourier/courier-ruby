# frozen_string_literal: true

module Courier
  module Send
    module Types
      class MessageProvidersType < Internal::Types::Model
        field :override, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :if_, -> { String }, optional: true, nullable: false
        field :timeouts, -> { Integer }, optional: true, nullable: false
        field :metadata, -> { Courier::Send::Types::Metadata }, optional: true, nullable: false
      end
    end
  end
end
