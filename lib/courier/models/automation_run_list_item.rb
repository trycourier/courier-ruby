# frozen_string_literal: true

module Courier
  module Models
    class AutomationRunListItem < Courier::Internal::Type::BaseModel
      # @!attribute run_id
      #   A unique identifier representing the run.
      #
      #   @return [String]
      required :run_id, String

      # @!attribute source
      #   Internal provenance strings describing what started the run, e.g.
      #   `invoke/<template_id>` or `segment/page/Pricing Page`. Diagnostic only — the
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
      #   The id of the Automation Template this run belongs to.
      #
      #   @return [String, nil]
      optional :template_id, String

      # @!method initialize(run_id:, source:, created_at: nil, status: nil, template_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::AutomationRunListItem} for more details.
      #
      #   An Automation run as it appears in a list response.
      #
      #   @param run_id [String] A unique identifier representing the run.
      #
      #   @param source [Array<String>] Internal provenance strings describing what started the run, e.g. `invoke/<templ
      #
      #   @param created_at [String] When the run started, as an ISO 8601 timestamp.
      #
      #   @param status [String] The state of the run: `PROCESSING`, `PROCESSED`, `WAITING`, `CANCELED`, `ERROR`,
      #
      #   @param template_id [String] The id of the Automation Template this run belongs to.
    end
  end
end
