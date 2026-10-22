# frozen_string_literal: true

module Courier
  module Models
    class JourneyRunStep < Courier::Internal::Type::BaseModel
      # @!attribute action
      #   The kind of node that ran, e.g. `send`, `delay`, or `exit`.
      #
      #   @return [String]
      required :action, String

      # @!attribute error
      #   Why the step failed. Set when `status` is `ERROR`, `null` otherwise.
      #
      #   @return [Courier::Models::JourneyRunStep::Error, nil]
      required :error, -> { Courier::JourneyRunStep::Error }, nil?: true

      # @!attribute skip_reason
      #   Why the step was skipped, e.g. `Node conditions not met`. Set when `status` is
      #   `SKIPPED`, `null` otherwise.
      #
      #   @return [String, nil]
      required :skip_reason, String, nil?: true

      # @!attribute status
      #   The state of the step: the seven run statuses, plus `SKIPPED` and `COMPUTING`.
      #   Not an enum — new values have been added before.
      #
      #   @return [String]
      required :status, String

      # @!attribute created_at
      #   When the step started, as an ISO 8601 timestamp.
      #
      #   @return [String, nil]
      optional :created_at, String

      # @!attribute message_id
      #   The message this step produced, present on send steps. Pass it to
      #   `GET /messages/{message_id}` for delivery status. A send to a List or an
      #   Audience yields one id for the request, not one per recipient.
      #
      #   @return [String, nil]
      optional :message_id, String

      # @!attribute node_id
      #   The id of the node in the published Journey that this step executed.
      #
      #   @return [String, nil]
      optional :node_id, String

      # @!attribute updated_at
      #   When the step last changed state, as an ISO 8601 timestamp.
      #
      #   @return [String, nil]
      optional :updated_at, String

      # @!method initialize(action:, error:, skip_reason:, status:, created_at: nil, message_id: nil, node_id: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyRunStep} for more details.
      #
      #   One executed node of a Journey run. `node_id` is the id of the node in the
      #   published Journey, so a step maps directly onto the Journey graph.
      #
      #   @param action [String] The kind of node that ran, e.g. `send`, `delay`, or `exit`.
      #
      #   @param error [Courier::Models::JourneyRunStep::Error, nil] Why the step failed. Set when `status` is `ERROR`, `null` otherwise.
      #
      #   @param skip_reason [String, nil] Why the step was skipped, e.g. `Node conditions not met`. Set when `status` is `
      #
      #   @param status [String] The state of the step: the seven run statuses, plus `SKIPPED` and `COMPUTING`. N
      #
      #   @param created_at [String] When the step started, as an ISO 8601 timestamp.
      #
      #   @param message_id [String] The message this step produced, present on send steps. Pass it to `GET /messages
      #
      #   @param node_id [String] The id of the node in the published Journey that this step executed.
      #
      #   @param updated_at [String] When the step last changed state, as an ISO 8601 timestamp.

      # @see Courier::Models::JourneyRunStep#error
      class Error < Courier::Internal::Type::BaseModel
        # @!attribute message
        #   The reason, e.g. `Fetch failed: GET api.example.com returned 404` or
        #   `AI step timed out after 15 minutes`.
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::JourneyRunStep::Error} for more details.
        #
        #   Why the step failed. Set when `status` is `ERROR`, `null` otherwise.
        #
        #   @param message [String] The reason, e.g. `Fetch failed: GET api.example.com returned 404` or `AI step ti
      end
    end
  end
end
