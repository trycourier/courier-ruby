# frozen_string_literal: true

module Courier
  module Models
    module Lists
      class RecipientPreferences < Courier::Internal::Type::BaseModel
        # @!attribute categories
        #
        #   @return [Hash{Symbol=>Courier::Models::Lists::NotificationPreferenceDetails}, nil]
        optional :categories,
                 -> { Courier::Internal::Type::HashOf[Courier::Lists::NotificationPreferenceDetails] },
                 nil?: true

        # @!attribute notifications
        #
        #   @return [Hash{Symbol=>Courier::Models::Lists::NotificationPreferenceDetails}, nil]
        optional :notifications,
                 -> { Courier::Internal::Type::HashOf[Courier::Lists::NotificationPreferenceDetails] },
                 nil?: true

        # @!method initialize(categories: nil, notifications: nil)
        #   @param categories [Hash{Symbol=>Courier::Models::Lists::NotificationPreferenceDetails}, nil]
        #   @param notifications [Hash{Symbol=>Courier::Models::Lists::NotificationPreferenceDetails}, nil]
      end
    end
  end
end
