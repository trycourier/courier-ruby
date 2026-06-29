# frozen_string_literal: true

module Courier
  module Models
    # Request body for `POST /journeys/cancel`. Provide EXACTLY ONE of
    # `cancelation_token` (cancels every run associated with the token) or `run_id`
    # (cancels a single tenant-scoped run).
    module CancelJourneyRequest
      extend Courier::Internal::Type::Union

      variant -> { Courier::CancelJourneyRequest::ByCancelationToken }

      variant -> { Courier::CancelJourneyRequest::ByRunID }

      class ByCancelationToken < Courier::Internal::Type::BaseModel
        # @!attribute cancelation_token
        #
        #   @return [String]
        required :cancelation_token, String

        # @!method initialize(cancelation_token:)
        #   @param cancelation_token [String]
      end

      class ByRunID < Courier::Internal::Type::BaseModel
        # @!attribute run_id
        #
        #   @return [String]
        required :run_id, String

        # @!method initialize(run_id:)
        #   @param run_id [String]
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::CancelJourneyRequest::ByCancelationToken, Courier::Models::CancelJourneyRequest::ByRunID)]
    end
  end
end
