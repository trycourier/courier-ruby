# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class Audience < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :description, -> { String }, optional: false, nullable: false
        field :filter, -> { Courier::Audiences::Types::Filter }, optional: false, nullable: false
        field :created_at, -> { String }, optional: false, nullable: false
        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
