# frozen_string_literal: true

module Courier
  module Models
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
      #   @return [Courier::Models::ChannelMetadata, nil]
      optional :metadata, -> { Courier::ChannelMetadata }, nil?: true

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
      #   @return [Symbol, Courier::Models::Channel::RoutingMethod, nil]
      optional :routing_method, enum: -> { Courier::Channel::RoutingMethod }, nil?: true

      # @!attribute timeouts
      #
      #   @return [Courier::Models::Timeouts, nil]
      optional :timeouts, -> { Courier::Timeouts }, nil?: true

      # @!method initialize(brand_id: nil, if_: nil, metadata: nil, override: nil, providers: nil, routing_method: nil, timeouts: nil)
      #   @param brand_id [String, nil] Brand id used for rendering.
      #
      #   @param if_ [String, nil] JS conditional with access to data/profile.
      #
      #   @param metadata [Courier::Models::ChannelMetadata, nil]
      #
      #   @param override [Hash{Symbol=>Object}, nil] Channel specific overrides.
      #
      #   @param providers [Array<String>, nil] Providers enabled for this channel.
      #
      #   @param routing_method [Symbol, Courier::Models::Channel::RoutingMethod, nil] Defaults to `single`.
      #
      #   @param timeouts [Courier::Models::Timeouts, nil]

      # Defaults to `single`.
      #
      # @see Courier::Models::Channel#routing_method
      module RoutingMethod
        extend Courier::Internal::Type::Enum

        ALL = :all
        SINGLE = :single

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
