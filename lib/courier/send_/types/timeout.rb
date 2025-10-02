# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Timeout < Internal::Types::Model
        field :provider, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: false
        field :channel, -> { Internal::Types::Hash[String, Integer] }, optional: true, nullable: false
        field :message, -> { Integer }, optional: true, nullable: false
        field :escalation, -> { Integer }, optional: true, nullable: false
        field :criteria, -> { Courier::Send::Types::Criteria }, optional: true, nullable: false
      end
    end
  end
end
