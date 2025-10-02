# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class AudienceUpdateParams < Internal::Types::Model
        field :audience_id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :filter, -> { Courier::Audiences::Types::Filter }, optional: true, nullable: false
      end
    end
  end
end
