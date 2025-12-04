# frozen_string_literal: true

module Trycourier
  module Models
    class ProfilePreferences < Trycourier::Internal::Type::BaseModel
      # @!attribute notifications
      #
      #   @return [Hash{Symbol=>Trycourier::Models::Preference}]
      required :notifications, -> { Trycourier::Internal::Type::HashOf[Trycourier::Preference] }

      # @!attribute categories
      #
      #   @return [Hash{Symbol=>Trycourier::Models::Preference}, nil]
      optional :categories, -> { Trycourier::Internal::Type::HashOf[Trycourier::Preference] }, nil?: true

      # @!attribute template_id
      #
      #   @return [String, nil]
      optional :template_id, String, api_name: :templateId, nil?: true

      # @!method initialize(notifications:, categories: nil, template_id: nil)
      #   @param notifications [Hash{Symbol=>Trycourier::Models::Preference}]
      #   @param categories [Hash{Symbol=>Trycourier::Models::Preference}, nil]
      #   @param template_id [String, nil]
    end
  end
end
