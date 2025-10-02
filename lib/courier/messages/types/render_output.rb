# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class RenderOutput < Internal::Types::Model
        field :channel, -> { String }, optional: false, nullable: false
        field :channel_id, -> { String }, optional: false, nullable: false
        field :content, -> { Courier::Messages::Types::RenderedMessageContent }, optional: false, nullable: false
      end
    end
  end
end
