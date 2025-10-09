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
        #
        #   @return [Trycourier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Trycourier::Models::InboundBulkMessage::InboundBulkContentMessage]
        required :definition, union: -> { Trycourier::InboundBulkMessage }

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
        #   @param definition [Trycourier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Trycourier::Models::InboundBulkMessage::InboundBulkContentMessage]
        #   @param enqueued [Integer]
        #   @param failures [Integer]
        #   @param received [Integer]
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
