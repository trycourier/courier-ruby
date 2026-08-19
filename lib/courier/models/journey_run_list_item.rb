# frozen_string_literal: true

module Courier
  module Models
    class JourneyRunListItem < Courier::Internal::Type::BaseModel
      # @!attribute run_id
      #   A unique identifier representing the run.
      #
      #   @return [String]
      required :run_id, String

      # @!attribute source
      #   Internal provenance strings describing what started the run. Diagnostic only.
      #
      #   @return [Array<String>]
      required :source, Courier::Internal::Type::ArrayOf[String]

      # @!attribute created_at
      #   When the run started, as an ISO 8601 timestamp.
      #
      #   @return [String, nil]
      optional :created_at, String

      # @!attribute status
      #   The state of the run. See `JourneyRun.status` for the values it takes.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute template_id
      #   The id of the Journey this run belongs to.
      #
      #   @return [String, nil]
      optional :template_id, String

      # @!method initialize(run_id:, source:, created_at: nil, status: nil, template_id: nil)
      #   A Journey run as it appears in a list response, without `updated_at`.
      #
      #   @param run_id [String] A unique identifier representing the run.
      #
      #   @param source [Array<String>] Internal provenance strings describing what started the run. Diagnostic only.
      #
      #   @param created_at [String] When the run started, as an ISO 8601 timestamp.
      #
      #   @param status [String] The state of the run. See `JourneyRun.status` for the values it takes.
      #
      #   @param template_id [String] The id of the Journey this run belongs to.
    end
  end
end
