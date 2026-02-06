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
      #   @return [Hash{Symbol=>Courier::Models::TenantTemplateInput::Channel}, nil]
      optional :channels, -> { Courier::Internal::Type::HashOf[Courier::TenantTemplateInput::Channel] }

      # @!attribute providers
      #   Provider-specific delivery configuration for routing to specific email/SMS
      #   providers
      #
      #   @return [Hash{Symbol=>Courier::Models::TenantTemplateInput::Provider}, nil]
      optional :providers, -> { Courier::Internal::Type::HashOf[Courier::TenantTemplateInput::Provider] }

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
      #   @param channels [Hash{Symbol=>Courier::Models::TenantTemplateInput::Channel}] Channel-specific delivery configuration (email, SMS, push, etc.)
      #
      #   @param providers [Hash{Symbol=>Courier::Models::TenantTemplateInput::Provider}] Provider-specific delivery configuration for routing to specific email/SMS provi
      #
      #   @param routing [Courier::Models::MessageRouting] Message routing configuration for multi-channel delivery strategies

      class Channel < Courier::Internal::Type::BaseModel
        # @!attribute brand_id
        #   Brand id used for rendering.
        #
        #   @return [String, nil]
        optional :brand_id, String, nil?: true

        # @!attribute if_
        #   JS conditional with access to data/profile.
        #
        #   @return [String, nil]
        optional :if_, String, api_name: :if, nil?: true

        # @!attribute metadata
        #
        #   @return [Courier::Models::TenantTemplateInput::Channel::Metadata, nil]
        optional :metadata, -> { Courier::TenantTemplateInput::Channel::Metadata }, nil?: true

        # @!attribute override
        #   Channel specific overrides.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute providers
        #   Providers enabled for this channel.
        #
        #   @return [Array<String>, nil]
        optional :providers, Courier::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute routing_method
        #   Defaults to `single`.
        #
        #   @return [Symbol, Courier::Models::TenantTemplateInput::Channel::RoutingMethod, nil]
        optional :routing_method,
                 enum: -> {
                   Courier::TenantTemplateInput::Channel::RoutingMethod
                 },
                 nil?: true

        # @!attribute timeouts
        #
        #   @return [Courier::Models::TenantTemplateInput::Channel::Timeouts, nil]
        optional :timeouts, -> { Courier::TenantTemplateInput::Channel::Timeouts }, nil?: true

        # @!method initialize(brand_id: nil, if_: nil, metadata: nil, override: nil, providers: nil, routing_method: nil, timeouts: nil)
        #   @param brand_id [String, nil] Brand id used for rendering.
        #
        #   @param if_ [String, nil] JS conditional with access to data/profile.
        #
        #   @param metadata [Courier::Models::TenantTemplateInput::Channel::Metadata, nil]
        #
        #   @param override [Hash{Symbol=>Object}, nil] Channel specific overrides.
        #
        #   @param providers [Array<String>, nil] Providers enabled for this channel.
        #
        #   @param routing_method [Symbol, Courier::Models::TenantTemplateInput::Channel::RoutingMethod, nil] Defaults to `single`.
        #
        #   @param timeouts [Courier::Models::TenantTemplateInput::Channel::Timeouts, nil]

        # @see Courier::Models::TenantTemplateInput::Channel#metadata
        class Metadata < Courier::Internal::Type::BaseModel
          # @!attribute utm
          #
          #   @return [Courier::Models::Utm, nil]
          optional :utm, -> { Courier::Utm }, nil?: true

          # @!method initialize(utm: nil)
          #   @param utm [Courier::Models::Utm, nil]
        end

        # Defaults to `single`.
        #
        # @see Courier::Models::TenantTemplateInput::Channel#routing_method
        module RoutingMethod
          extend Courier::Internal::Type::Enum

          ALL = :all
          SINGLE = :single

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Courier::Models::TenantTemplateInput::Channel#timeouts
        class Timeouts < Courier::Internal::Type::BaseModel
          # @!attribute channel
          #
          #   @return [Integer, nil]
          optional :channel, Integer, nil?: true

          # @!attribute provider
          #
          #   @return [Integer, nil]
          optional :provider, Integer, nil?: true

          # @!method initialize(channel: nil, provider: nil)
          #   @param channel [Integer, nil]
          #   @param provider [Integer, nil]
        end
      end

      class Provider < Courier::Internal::Type::BaseModel
        # @!attribute if_
        #   JS conditional with access to data/profile.
        #
        #   @return [String, nil]
        optional :if_, String, api_name: :if, nil?: true

        # @!attribute metadata
        #
        #   @return [Courier::Models::TenantTemplateInput::Provider::Metadata, nil]
        optional :metadata, -> { Courier::TenantTemplateInput::Provider::Metadata }, nil?: true

        # @!attribute override
        #   Provider-specific overrides.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute timeouts
        #
        #   @return [Integer, nil]
        optional :timeouts, Integer, nil?: true

        # @!method initialize(if_: nil, metadata: nil, override: nil, timeouts: nil)
        #   @param if_ [String, nil] JS conditional with access to data/profile.
        #
        #   @param metadata [Courier::Models::TenantTemplateInput::Provider::Metadata, nil]
        #
        #   @param override [Hash{Symbol=>Object}, nil] Provider-specific overrides.
        #
        #   @param timeouts [Integer, nil]

        # @see Courier::Models::TenantTemplateInput::Provider#metadata
        class Metadata < Courier::Internal::Type::BaseModel
          # @!attribute utm
          #
          #   @return [Courier::Models::Utm, nil]
          optional :utm, -> { Courier::Utm }, nil?: true

          # @!method initialize(utm: nil)
          #   @param utm [Courier::Models::Utm, nil]
        end
      end
    end
  end
end
