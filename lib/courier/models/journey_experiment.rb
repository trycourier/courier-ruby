# frozen_string_literal: true

module Courier
  module Models
    class JourneyExperiment < Courier::Internal::Type::BaseModel
      # @!attribute bucketing_key
      #   The value used to deterministically assign a recipient to a variant. Must be
      #   non-empty with no leading or trailing whitespace.
      #
      #   @return [String]
      required :bucketing_key, String, api_name: :bucketingKey

      # @!attribute variants
      #   Between 2 and 10 weighted template variants.
      #
      #   @return [Array<Courier::Models::JourneyExperimentVariant>]
      required :variants, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyExperimentVariant] }

      # @!attribute id
      #   Server-authoritative experiment id (prefixed `exp_`). Omit to have the server
      #   mint one; when supplied it must be a valid `exp_` id.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute name
      #   Optional, cosmetic display name for the experiment.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(bucketing_key:, variants:, id: nil, name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyExperiment} for more details.
      #
      #   A/B experiment config for a send node. The recipient is deterministically
      #   bucketed by `bucketingKey` and routed to one of the `variants` in proportion to
      #   its `weight`. Present on a send node INSTEAD OF `message.template`.
      #
      #   @param bucketing_key [String] The value used to deterministically assign a recipient to a variant. Must be non
      #
      #   @param variants [Array<Courier::Models::JourneyExperimentVariant>] Between 2 and 10 weighted template variants.
      #
      #   @param id [String] Server-authoritative experiment id (prefixed `exp_`). Omit to have the server mi
      #
      #   @param name [String] Optional, cosmetic display name for the experiment.
    end
  end
end
