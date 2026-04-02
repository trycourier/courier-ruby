# frozen_string_literal: true

module Courier
  module Models
    class TenantTemplateInput < Courier::Internal::Type::BaseModel
      # @!attribute content
      #   Template content configuration including blocks, elements, and message structure
      #
      #   @return [Courier::Models::ElementalContent]
      required :content, -> { Courier::ElementalContent }

      # @!attribute channels
      #   Channel-specific delivery configuration (email, SMS, push, etc.)
      #
      #   @return [Hash{Symbol=>Courier::Models::Channel}, nil]
      optional :channels, -> { Courier::Internal::Type::HashOf[Courier::Channel] }

      # @!attribute providers
      #   Provider-specific delivery configuration for routing to specific email/SMS
      #   providers
      #
      #   @return [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil]
      optional :providers, -> { Courier::Internal::Type::HashOf[Courier::MessageProvidersType] }

      # @!attribute routing
      #   Message routing configuration for multi-channel delivery strategies
      #
      #   @return [Courier::Models::MessageRouting, nil]
      optional :routing, -> { Courier::MessageRouting }

      # @!method initialize(content:, channels: nil, providers: nil, routing: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TenantTemplateInput} for more details.
      #
      #   Template configuration for creating or updating a tenant notification template
      #
      #   @param content [Courier::Models::ElementalContent] Template content configuration including blocks, elements, and message structure
      #
      #   @param channels [Hash{Symbol=>Courier::Models::Channel}] Channel-specific delivery configuration (email, SMS, push, etc.)
      #
      #   @param providers [Hash{Symbol=>Courier::Models::MessageProvidersType}] Provider-specific delivery configuration for routing to specific email/SMS provi
      #
      #   @param routing [Courier::Models::MessageRouting] Message routing configuration for multi-channel delivery strategies
    end
  end
end
