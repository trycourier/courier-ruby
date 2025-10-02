# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class List < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :created, -> { String }, optional: true, nullable: false
        field :updated, -> { String }, optional: true, nullable: false
      end
    end
  end
end
