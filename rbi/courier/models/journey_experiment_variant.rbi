# typed: strong

module Courier
  module Models
    class JourneyExperimentVariant < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyExperimentVariant, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # The notification template sent for this variant.
      sig { returns(String) }
      attr_accessor :template_id

      # Relative routing weight. Must be non-negative.
      sig { returns(Float) }
      attr_accessor :weight

      # Optional, cosmetic display name for the variant.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # A single weighted arm of an experiment. Variant ids must be unique within the
      # experiment and the sum of all variant weights must be greater than 0. Weights
      # are relative (no sum-to-100 requirement) — routing normalizes them
      # proportionally.
      sig do
        params(
          id: String,
          template_id: String,
          weight: Float,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # The notification template sent for this variant.
        template_id:,
        # Relative routing weight. Must be non-negative.
        weight:,
        # Optional, cosmetic display name for the variant.
        name: nil
      )
      end

      sig do
        override.returns(
          { id: String, template_id: String, weight: Float, name: String }
        )
      end
      def to_hash
      end
    end
  end
end
