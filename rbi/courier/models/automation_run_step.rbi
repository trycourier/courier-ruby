# typed: strong

module Courier
  module Models
    class AutomationRunStep < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AutomationRunStep, Courier::Internal::AnyHash)
        end

      # The kind of step that ran, e.g. `send`, `delay`, or `update-profile`.
      sig { returns(String) }
      attr_accessor :action

      # The state of the step: the seven run statuses, plus `SKIPPED` and `COMPUTING`.
      # Not an enum — new values have been added before.
      sig { returns(String) }
      attr_accessor :status

      # When the step started, as an ISO 8601 timestamp.
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # The message this step produced, present on send steps. Pass it to
      # `GET /messages/{message_id}` for delivery status. A send to a List or an
      # Audience yields one id for the request, not one per recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :message_id

      sig { params(message_id: String).void }
      attr_writer :message_id

      # A unique identifier representing the step.
      sig { returns(T.nilable(String)) }
      attr_reader :step_id

      sig { params(step_id: String).void }
      attr_writer :step_id

      # When the step last changed state, as an ISO 8601 timestamp.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # One executed step of an Automation run.
      sig do
        params(
          action: String,
          status: String,
          created_at: String,
          message_id: String,
          step_id: String,
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The kind of step that ran, e.g. `send`, `delay`, or `update-profile`.
        action:,
        # The state of the step: the seven run statuses, plus `SKIPPED` and `COMPUTING`.
        # Not an enum — new values have been added before.
        status:,
        # When the step started, as an ISO 8601 timestamp.
        created_at: nil,
        # The message this step produced, present on send steps. Pass it to
        # `GET /messages/{message_id}` for delivery status. A send to a List or an
        # Audience yields one id for the request, not one per recipient.
        message_id: nil,
        # A unique identifier representing the step.
        step_id: nil,
        # When the step last changed state, as an ISO 8601 timestamp.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            action: String,
            status: String,
            created_at: String,
            message_id: String,
            step_id: String,
            updated_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
