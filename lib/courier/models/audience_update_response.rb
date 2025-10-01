# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Audiences#update
    class AudienceUpdateResponse < Courier::Internal::Type::BaseModel
      # @!attribute audience
      #
      #   @return [Courier::Models::Audience]
      required :audience, -> { Courier::Audience }

      # @!method initialize(audience:)
      #   @param audience [Courier::Models::Audience]
    end
  end
end
