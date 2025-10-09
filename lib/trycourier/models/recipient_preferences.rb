# frozen_string_literal: true

module Trycourier
  module Models
    class RecipientPreferences < Trycourier::Internal::Type::BaseModel
      # @!attribute categories
      #
      #   @return [Hash{Symbol=>Trycourier::Models::NotificationPreferenceDetails}, nil]
      optional :categories,
               -> { Trycourier::Internal::Type::HashOf[Trycourier::NotificationPreferenceDetails] },
               nil?: true

      # @!attribute notifications
      #
      #   @return [Hash{Symbol=>Trycourier::Models::NotificationPreferenceDetails}, nil]
      optional :notifications,
               -> { Trycourier::Internal::Type::HashOf[Trycourier::NotificationPreferenceDetails] },
               nil?: true

      # @!method initialize(categories: nil, notifications: nil)
      #   @param categories [Hash{Symbol=>Trycourier::Models::NotificationPreferenceDetails}, nil]
      #   @param notifications [Hash{Symbol=>Trycourier::Models::NotificationPreferenceDetails}, nil]
    end
  end
end
