# frozen_string_literal: true

module Courier
  module Inbound
    module Types
      class InboundTrackEvent < Internal::Types::Model
        field :event, -> { String }, optional: false, nullable: false
        field :message_id, -> { String }, optional: false, nullable: false
        field :properties, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: false, nullable: false
        field :type, -> { String }, optional: false, nullable: false
        field :user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
