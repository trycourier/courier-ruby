# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#retrieve_job
    class BulkRetrieveJobResponse < Courier::Internal::Type::BaseModel
      # @!attribute job
      #
      #   @return [Courier::Models::BulkRetrieveJobResponse::Job]
      required :job, -> { Courier::Models::BulkRetrieveJobResponse::Job }

      # @!method initialize(job:)
      #   @param job [Courier::Models::BulkRetrieveJobResponse::Job]

      # @see Courier::Models::BulkRetrieveJobResponse#job
      class Job < Courier::Internal::Type::BaseModel
        # @!attribute definition
        #
        #   @return [Courier::Models::InboundBulkMessage]
        required :definition, -> { Courier::InboundBulkMessage }

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
        #   @return [Symbol, Courier::Models::BulkRetrieveJobResponse::Job::Status]
        required :status, enum: -> { Courier::Models::BulkRetrieveJobResponse::Job::Status }

        # @!method initialize(definition:, enqueued:, failures:, received:, status:)
        #   @param definition [Courier::Models::InboundBulkMessage]
        #   @param enqueued [Integer]
        #   @param failures [Integer]
        #   @param received [Integer]
        #   @param status [Symbol, Courier::Models::BulkRetrieveJobResponse::Job::Status]

        # @see Courier::Models::BulkRetrieveJobResponse::Job#status
        module Status
          extend Courier::Internal::Type::Enum

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
