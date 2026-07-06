# frozen_string_literal: true

module Courier
  module Models
    class JourneyExperimentVariant < Courier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute template_id
      #   The notification template sent for this variant.
      #
      #   @return [String]
      required :template_id, String, api_name: :templateId

      # @!attribute weight
      #   Relative routing weight. Must be non-negative.
      #
      #   @return [Float]
      required :weight, Float

      # @!attribute name
      #   Optional display name for the variant.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(id:, template_id:, weight:, name: nil)
      #   A single weighted variant of an experiment. Variant ids must be unique within
      #   the experiment and the sum of all variant weights must be greater than 0.
      #   Weights are relative (no sum-to-100 requirement) — routing normalizes them
      #   proportionally.
      #
      #   @param id [String]
      #
      #   @param template_id [String] The notification template sent for this variant.
      #
      #   @param weight [Float] Relative routing weight. Must be non-negative.
      #
      #   @param name [String] Optional display name for the variant.
    end
  end
end
