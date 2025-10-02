# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class InboundBulkMessageV1 < Internal::Types::Model
        field :brand, -> { String }, optional: true, nullable: false
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :event, -> { String }, optional: true, nullable: false
        field :locale, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :override, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end
