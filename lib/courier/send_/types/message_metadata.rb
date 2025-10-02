# frozen_string_literal: true

module Courier
  module Send
    module Types
      class MessageMetadata < Internal::Types::Model
        field :event, -> { String }, optional: true, nullable: false
        field :tags, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :utm, -> { Courier::Send::Types::Utm }, optional: true, nullable: false
        field :trace_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
