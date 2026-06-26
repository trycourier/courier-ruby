# frozen_string_literal: true

module Courier
  module Models
    class WorkspacePreferenceCreateRequest < Courier::Internal::Type::BaseModel
      # @!attribute name
      #   Human-readable name for the workspace preference.
      #
      #   @return [String]
      required :name, String

      # @!attribute has_custom_routing
      #   Whether the workspace preference defines custom routing for its topics.
      #
      #   @return [Boolean, nil]
      optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

      # @!attribute routing_options
      #   Default channels for the workspace preference. Defaults to empty if omitted.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
      optional :routing_options,
               -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
               nil?: true

      # @!method initialize(name:, has_custom_routing: nil, routing_options: nil)
      #   Request body for creating a workspace preference.
      #
      #   @param name [String] Human-readable name for the workspace preference.
      #
      #   @param has_custom_routing [Boolean, nil] Whether the workspace preference defines custom routing for its topics.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels for the workspace preference. Defaults to empty if omitted.
    end
  end
end
