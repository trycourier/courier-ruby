# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class AudienceUpdateResponse < Internal::Types::Model
        field :audience, -> { Courier::Audiences::Types::Audience }, optional: false, nullable: false
      end
    end
  end
end
