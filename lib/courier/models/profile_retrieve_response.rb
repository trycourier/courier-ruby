# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Profiles#retrieve
    class ProfileRetrieveResponse < Courier::Internal::Type::BaseModel
      # @!attribute profile
      #
      #   @return [Hash{Symbol=>Object}]
      required :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute preferences
      #
      #   @return [Courier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

      # @!method initialize(profile:, preferences: nil)
      #   @param profile [Hash{Symbol=>Object}]
      #   @param preferences [Courier::Models::RecipientPreferences, nil]
    end
  end
end
