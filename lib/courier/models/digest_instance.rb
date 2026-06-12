# frozen_string_literal: true

module Courier
  module Models
    class DigestInstance < Courier::Internal::Type::BaseModel
      # @!attribute digest_instance_id
      #   A unique identifier for the digest instance.
      #
      #   @return [String]
      required :digest_instance_id, String

      # @!attribute event_count
      #   The total number of events received for this instance.
      #
      #   @return [Integer]
      required :event_count, Integer

      # @!attribute status
      #   The status of the digest instance. `IN_PROGRESS` instances are still
      #   accumulating events; `COMPLETED` instances have been released.
      #
      #   @return [Symbol, Courier::Models::DigestInstance::Status]
      required :status, enum: -> { Courier::DigestInstance::Status }

      # @!attribute user_id
      #   The ID of the user this digest instance belongs to.
      #
      #   @return [String]
      required :user_id, String

      # @!attribute categories
      #   The categories configured for the digest.
      #
      #   @return [Array<Courier::Models::DigestCategory>, nil]
      optional :categories, -> { Courier::Internal::Type::ArrayOf[Courier::DigestCategory] }

      # @!attribute category_key_counts
      #   A map of category key to the number of events received for that category.
      #
      #   @return [Hash{Symbol=>Integer}, nil]
      optional :category_key_counts, Courier::Internal::Type::HashOf[Integer]

      # @!attribute created_at
      #   An ISO 8601 timestamp of when the digest instance was created.
      #
      #   @return [String, nil]
      optional :created_at, String

      # @!attribute disabled
      #   Whether the digest instance has been disabled.
      #
      #   @return [Boolean, nil]
      optional :disabled, Courier::Internal::Type::Boolean

      # @!attribute tenant_id
      #   The ID of the tenant this digest instance belongs to, if any.
      #
      #   @return [String, nil]
      optional :tenant_id, String, nil?: true

      # @!method initialize(digest_instance_id:, event_count:, status:, user_id:, categories: nil, category_key_counts: nil, created_at: nil, disabled: nil, tenant_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::DigestInstance} for more details.
      #
      #   @param digest_instance_id [String] A unique identifier for the digest instance.
      #
      #   @param event_count [Integer] The total number of events received for this instance.
      #
      #   @param status [Symbol, Courier::Models::DigestInstance::Status] The status of the digest instance. `IN_PROGRESS` instances are still accumulatin
      #
      #   @param user_id [String] The ID of the user this digest instance belongs to.
      #
      #   @param categories [Array<Courier::Models::DigestCategory>] The categories configured for the digest.
      #
      #   @param category_key_counts [Hash{Symbol=>Integer}] A map of category key to the number of events received for that category.
      #
      #   @param created_at [String] An ISO 8601 timestamp of when the digest instance was created.
      #
      #   @param disabled [Boolean] Whether the digest instance has been disabled.
      #
      #   @param tenant_id [String, nil] The ID of the tenant this digest instance belongs to, if any.

      # The status of the digest instance. `IN_PROGRESS` instances are still
      # accumulating events; `COMPLETED` instances have been released.
      #
      # @see Courier::Models::DigestInstance#status
      module Status
        extend Courier::Internal::Type::Enum

        IN_PROGRESS = :IN_PROGRESS
        COMPLETED = :COMPLETED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
