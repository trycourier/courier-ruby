# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class AudienceMember < Internal::Types::Model
        field :added_at, -> { String }, optional: false, nullable: false
        field :audience_id, -> { String }, optional: false, nullable: false
        field :audience_version, -> { Integer }, optional: false, nullable: false
        field :member_id, -> { String }, optional: false, nullable: false
        field :reason, -> { String }, optional: false, nullable: false
      end
    end
  end
end
