# frozen_string_literal: true

module Courier
  module Models
    class JourneyRunStep < Courier::Internal::Type::BaseModel
      # @!attribute action
      #   The kind of node that ran, e.g. `send`, `delay`, or `exit`.
      #
      #   @return [String]
      required :action, String

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

      # @!method initialize(action:, status:, created_at: nil, message_id: nil, node_id: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyRunStep} for more details.
      #
      #   One executed node of a Journey run. `node_id` is the id of the node in the
      #   published Journey, so a step maps directly onto the Journey graph.
      #
      #   @param action [String] The kind of node that ran, e.g. `send`, `delay`, or `exit`.
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
    end
  end
end
