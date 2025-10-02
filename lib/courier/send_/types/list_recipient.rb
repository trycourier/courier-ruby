# frozen_string_literal: true

module Courier
  module Send
    module Types
      class ListRecipient < Internal::Types::Model
        field :list_id, -> { String }, optional: true, nullable: false
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :filters, -> { Internal::Types::Array[Courier::Send::Types::ListFilter] }, optional: true, nullable: false
      end
    end
  end
end
