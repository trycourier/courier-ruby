# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Utm < Internal::Types::Model
        field :source, -> { String }, optional: true, nullable: false
        field :medium, -> { String }, optional: true, nullable: false
        field :campaign, -> { String }, optional: true, nullable: false
        field :term, -> { String }, optional: true, nullable: false
        field :content, -> { String }, optional: true, nullable: false
      end
    end
  end
end
