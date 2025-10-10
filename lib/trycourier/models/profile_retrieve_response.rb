# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Profiles#retrieve
    class ProfileRetrieveResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute profile
      #
      #   @return [Hash{Symbol=>Object}]
      required :profile, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]

      # @!attribute preferences
      #
      #   @return [Trycourier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

      # @!method initialize(profile:, preferences: nil)
      #   @param profile [Hash{Symbol=>Object}]
      #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
    end
  end
end
