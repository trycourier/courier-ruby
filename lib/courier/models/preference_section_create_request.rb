# frozen_string_literal: true

module Courier
  module Models
    class PreferenceSectionCreateRequest < Courier::Internal::Type::BaseModel
      # @!attribute name
      #   Human-readable name for the section.
      #
      #   @return [String]
      required :name, String

      # @!attribute has_custom_routing
      #   Whether the section defines custom routing for its topics.
      #
      #   @return [Boolean, nil]
      optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

      # @!attribute routing_options
      #   Default channels for the section. Defaults to empty if omitted.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
      optional :routing_options,
               -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
               nil?: true

      # @!method initialize(name:, has_custom_routing: nil, routing_options: nil)
      #   Request body for creating a preference section.
      #
      #   @param name [String] Human-readable name for the section.
      #
      #   @param has_custom_routing [Boolean, nil] Whether the section defines custom routing for its topics.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels for the section. Defaults to empty if omitted.
    end
  end
end
