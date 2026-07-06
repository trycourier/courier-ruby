# frozen_string_literal: true

module Courier
  module Models
    # `202 Accepted` body for `POST /journeys/cancel`, returning the submitted
    # identifier. When called with `cancelation_token`, returns
    # `{ cancelation_token }`; when called with `run_id`, returns
    # `{ run_id, status }`.
    #
    # @see Courier::Resources::Journeys#cancel
    module CancelJourneyResponse
      extend Courier::Internal::Type::Union

      variant -> { Courier::CancelJourneyResponse::TokenBranch }

      variant -> { Courier::CancelJourneyResponse::RunIDBranch }

      class TokenBranch < Courier::Internal::Type::BaseModel
        # @!attribute cancelation_token
        #
        #   @return [String]
        required :cancelation_token, String

        # @!method initialize(cancelation_token:)
        #   @param cancelation_token [String]
      end

      class RunIDBranch < Courier::Internal::Type::BaseModel
        # @!attribute run_id
        #
        #   @return [String]
        required :run_id, String

        # @!attribute status
        #   The run's resulting status. `CANCELED` when the run was active and has been
        #   canceled; `PROCESSED` or `ERROR` when the run had already finished and was left
        #   unchanged; `CANCELED` for an already-canceled run.
        #
        #   @return [String]
        required :status, String

        # @!method initialize(run_id:, status:)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::CancelJourneyResponse::RunIDBranch} for more details.
        #
        #   @param run_id [String]
        #
        #   @param status [String] The run's resulting status. `CANCELED` when the run was active and has been canc
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::CancelJourneyResponse::TokenBranch, Courier::Models::CancelJourneyResponse::RunIDBranch)]
    end
  end
end
