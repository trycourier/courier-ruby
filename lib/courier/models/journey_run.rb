# frozen_string_literal: true

module Courier
  module Models
    class JourneyRun < Courier::Internal::Type::BaseModel
      # @!attribute run_id
      #   A unique identifier representing the run.
      #
      #   @return [String]
      required :run_id, String

      # @!attribute source
      #   Internal provenance strings describing what started the run, e.g.
      #   `invoke/<journey_id>` or `segment/page/Pricing Page`. Diagnostic only — the
      #   format is unstable and should not be parsed.
      #
      #   @return [Array<String>]
      required :source, Courier::Internal::Type::ArrayOf[String]

      # @!attribute created_at
      #   When the run started, as an ISO 8601 timestamp.
      #
      #   @return [String, nil]
      optional :created_at, String

      # @!attribute status
      #   The state of the run: `PROCESSING`, `PROCESSED`, `WAITING`, `CANCELED`, `ERROR`,
      #   `THROTTLED`, or `NOT PROCESSED`. Not an enum — new values have been added
      #   before.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute template_id
      #   The id of the Journey this run belongs to.
      #
      #   @return [String, nil]
      optional :template_id, String

      # @!attribute updated_at
      #   When the run last changed state, as an ISO 8601 timestamp.
      #
      #   @return [String, nil]
      optional :updated_at, String

      # @!method initialize(run_id:, source:, created_at: nil, status: nil, template_id: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyRun} for more details.
      #
      #   One run of a Journey. `status` and `created_at` are absent on a small number of
      #   legacy runs stored without them.
      #
      #   @param run_id [String] A unique identifier representing the run.
      #
      #   @param source [Array<String>] Internal provenance strings describing what started the run, e.g. `invoke/<journ
      #
      #   @param created_at [String] When the run started, as an ISO 8601 timestamp.
      #
      #   @param status [String] The state of the run: `PROCESSING`, `PROCESSED`, `WAITING`, `CANCELED`, `ERROR`,
      #
      #   @param template_id [String] The id of the Journey this run belongs to.
      #
      #   @param updated_at [String] When the run last changed state, as an ISO 8601 timestamp.
    end
  end
end
