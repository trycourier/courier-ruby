# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class AudiencesListParams < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
