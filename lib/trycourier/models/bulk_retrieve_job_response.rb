# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Bulk#retrieve_job
    class BulkRetrieveJobResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute job
      #
      #   @return [Trycourier::Models::BulkRetrieveJobResponse::Job]
      required :job, -> { Trycourier::Models::BulkRetrieveJobResponse::Job }

      # @!method initialize(job:)
      #   @param job [Trycourier::Models::BulkRetrieveJobResponse::Job]

      # @see Trycourier::Models::BulkRetrieveJobResponse#job
      class Job < Trycourier::Internal::Type::BaseModel
        # @!attribute definition
        #   Bulk message definition. Supports two formats:
        #
        #   - V1 format: Requires `event` field (event ID or notification ID)
        #   - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
        #     content) in addition to `event`
        #
        #   @return [Trycourier::Models::InboundBulkMessage]
        required :definition, -> { Trycourier::InboundBulkMessage }

        # @!attribute enqueued
        #
        #   @return [Integer]
        required :enqueued, Integer

        # @!attribute failures
        #
        #   @return [Integer]
        required :failures, Integer

        # @!attribute received
        #
        #   @return [Integer]
        required :received, Integer

        # @!attribute status
        #
        #   @return [Symbol, Trycourier::Models::BulkRetrieveJobResponse::Job::Status]
        required :status, enum: -> { Trycourier::Models::BulkRetrieveJobResponse::Job::Status }

        # @!method initialize(definition:, enqueued:, failures:, received:, status:)
        #   Some parameter documentations has been truncated, see
        #   {Trycourier::Models::BulkRetrieveJobResponse::Job} for more details.
        #
        #   @param definition [Trycourier::Models::InboundBulkMessage] Bulk message definition. Supports two formats:
        #
        #   @param enqueued [Integer]
        #
        #   @param failures [Integer]
        #
        #   @param received [Integer]
        #
        #   @param status [Symbol, Trycourier::Models::BulkRetrieveJobResponse::Job::Status]

        # @see Trycourier::Models::BulkRetrieveJobResponse::Job#status
        module Status
          extend Trycourier::Internal::Type::Enum

          CREATED = :CREATED
          PROCESSING = :PROCESSING
          COMPLETED = :COMPLETED
          ERROR = :ERROR

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
