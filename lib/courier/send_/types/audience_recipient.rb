# frozen_string_literal: true

module Courier
  module Send
    module Types
      class AudienceRecipient < Internal::Types::Model
        field :audience_id, -> { String }, optional: false, nullable: false
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :filters, lambda {
          Internal::Types::Array[Courier::Send::Types::AudienceFilter]
        }, optional: true, nullable: false
      end
    end
  end
end
