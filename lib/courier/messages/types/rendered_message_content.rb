# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class RenderedMessageContent < Internal::Types::Model
        field :html, -> { String }, optional: false, nullable: false
        field :title, -> { String }, optional: false, nullable: false
        field :body, -> { String }, optional: false, nullable: false
        field :subject, -> { String }, optional: false, nullable: false
        field :text, -> { String }, optional: false, nullable: false
        field :blocks, lambda {
          Internal::Types::Array[Courier::Messages::Types::RenderedMessageBlock]
        }, optional: false, nullable: false
      end
    end
  end
end
