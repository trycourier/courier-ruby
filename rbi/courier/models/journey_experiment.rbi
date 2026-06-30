# typed: strong

module Courier
  module Models
    class JourneyExperiment < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyExperiment, Courier::Internal::AnyHash)
        end

      # The value used to deterministically assign a recipient to a variant. Must be
      # non-empty with no leading or trailing whitespace.
      sig { returns(String) }
      attr_accessor :bucketing_key

      # Between 2 and 10 weighted template variants.
      sig { returns(T::Array[Courier::JourneyExperimentVariant]) }
      attr_accessor :variants

      # Server-authoritative experiment id (prefixed `exp_`). Omit to have the server
      # mint one; when supplied it must be a valid `exp_` id.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Optional, cosmetic display name for the experiment.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # A/B experiment config for a send node. The recipient is deterministically
      # bucketed by `bucketingKey` and routed to one of the `variants` in proportion to
      # its `weight`. Present on a send node INSTEAD OF `message.template`.
      sig do
        params(
          bucketing_key: String,
          variants: T::Array[Courier::JourneyExperimentVariant::OrHash],
          id: String,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The value used to deterministically assign a recipient to a variant. Must be
        # non-empty with no leading or trailing whitespace.
        bucketing_key:,
        # Between 2 and 10 weighted template variants.
        variants:,
        # Server-authoritative experiment id (prefixed `exp_`). Omit to have the server
        # mint one; when supplied it must be a valid `exp_` id.
        id: nil,
        # Optional, cosmetic display name for the experiment.
        name: nil
      )
      end

      sig do
        override.returns(
          {
            bucketing_key: String,
            variants: T::Array[Courier::JourneyExperimentVariant],
            id: String,
            name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
