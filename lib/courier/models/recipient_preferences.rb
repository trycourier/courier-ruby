# frozen_string_literal: true

module Courier
  module Models
    class RecipientPreferences < Courier::Internal::Type::BaseModel
      # @!attribute categories
      #
      #   @return [Hash{Symbol=>Courier::Models::NotificationPreferenceDetails}, nil]
      optional :categories,
               -> { Courier::Internal::Type::HashOf[Courier::NotificationPreferenceDetails] },
               nil?: true

      # @!attribute notifications
      #
      #   @return [Hash{Symbol=>Courier::Models::NotificationPreferenceDetails}, nil]
      optional :notifications,
               -> { Courier::Internal::Type::HashOf[Courier::NotificationPreferenceDetails] },
               nil?: true

      # @!method initialize(categories: nil, notifications: nil)
      #   @param categories [Hash{Symbol=>Courier::Models::NotificationPreferenceDetails}, nil]
      #   @param notifications [Hash{Symbol=>Courier::Models::NotificationPreferenceDetails}, nil]
    end
  end
end
