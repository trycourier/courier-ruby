# frozen_string_literal: true

module Courier
  module Models
    module Automations
      class AutomationInvokeParams < Courier::Internal::Type::BaseModel
        # @!attribute brand
        #
        #   @return [String, nil]
        optional :brand, String, nil?: true

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute profile
        #
        #   @return [Object, nil]
        optional :profile, Courier::Internal::Type::Unknown

        # @!attribute recipient
        #
        #   @return [String, nil]
        optional :recipient, String, nil?: true

        # @!attribute template
        #
        #   @return [String, nil]
        optional :template, String, nil?: true

        # @!method initialize(brand: nil, data: nil, profile: nil, recipient: nil, template: nil)
        #   @param brand [String, nil]
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param profile [Object]
        #   @param recipient [String, nil]
        #   @param template [String, nil]
      end
    end

    AutomationInvokeParams = Automations::AutomationInvokeParams
  end
end
