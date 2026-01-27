# frozen_string_literal: true

module Courier
  module Models
    module Automations
      # @see Courier::Resources::Automations::Invoke#invoke_by_template
      class InvokeInvokeByTemplateParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute recipient
        #
        #   @return [String, nil]
        required :recipient, String, nil?: true

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
        #   @return [Hash{Symbol=>Object}, nil]
        optional :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute template
        #
        #   @return [String, nil]
        optional :template, String, nil?: true

        # @!method initialize(recipient:, brand: nil, data: nil, profile: nil, template: nil, request_options: {})
        #   @param recipient [String, nil]
        #   @param brand [String, nil]
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param profile [Hash{Symbol=>Object}, nil]
        #   @param template [String, nil]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
