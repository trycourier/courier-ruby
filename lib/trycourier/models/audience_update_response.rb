# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Audiences#update
    class AudienceUpdateResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute audience
      #
      #   @return [Trycourier::Models::Audience]
      required :audience, -> { Trycourier::Audience }

      # @!method initialize(audience:)
      #   @param audience [Trycourier::Models::Audience]
    end
  end
end
