# frozen_string_literal: true

module Courier
  module Models
    class WorkspacePreferenceReplaceRequest < Courier::Internal::Type::BaseModel
      # @!attribute name
      #   Human-readable name for the workspace preference.
      #
      #   @return [String]
      required :name, String

      # @!attribute description
      #   Optional description shown under the section on the hosted preferences page.
      #   Omit to clear.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute has_custom_routing
      #   Whether the workspace preference defines custom routing for its topics.
      #
      #   @return [Boolean, nil]
      optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

      # @!attribute routing_options
      #   Default channels for the workspace preference. Omit to clear.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
      optional :routing_options,
               -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
               nil?: true

      # @!method initialize(name:, description: nil, has_custom_routing: nil, routing_options: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::WorkspacePreferenceReplaceRequest} for more details.
      #
      #   Request body for replacing a workspace preference. Full document replacement;
      #   missing optional fields are cleared.
      #
      #   @param name [String] Human-readable name for the workspace preference.
      #
      #   @param description [String, nil] Optional description shown under the section on the hosted preferences page. Omi
      #
      #   @param has_custom_routing [Boolean, nil] Whether the workspace preference defines custom routing for its topics.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels for the workspace preference. Omit to clear.
    end
  end
end
