# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class AudienceMembersListParams < Internal::Types::Model
        field :audience_id, -> { String }, optional: false, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
