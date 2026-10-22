# typed: strong

module Courier
  module Models
    class JourneyRunStep < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyRunStep, Courier::Internal::AnyHash)
        end

      # The kind of node that ran, e.g. `send`, `delay`, or `exit`.
      sig { returns(String) }
      attr_accessor :action

      # Why the step failed. Set when `status` is `ERROR`, `null` otherwise.
      sig { returns(T.nilable(Courier::JourneyRunStep::Error)) }
      attr_reader :error

      sig do
        params(error: T.nilable(Courier::JourneyRunStep::Error::OrHash)).void
      end
      attr_writer :error

      # Why the step was skipped, e.g. `Node conditions not met`. Set when `status` is
      # `SKIPPED`, `null` otherwise.
      sig { returns(T.nilable(String)) }
      attr_accessor :skip_reason

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

      # The id of the node in the published Journey that this step executed.
      sig { returns(T.nilable(String)) }
      attr_reader :node_id

      sig { params(node_id: String).void }
      attr_writer :node_id

      # When the step last changed state, as an ISO 8601 timestamp.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # One executed node of a Journey run. `node_id` is the id of the node in the
      # published Journey, so a step maps directly onto the Journey graph.
      sig do
        params(
          action: String,
          error: T.nilable(Courier::JourneyRunStep::Error::OrHash),
          skip_reason: T.nilable(String),
          status: String,
          created_at: String,
          message_id: String,
          node_id: String,
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The kind of node that ran, e.g. `send`, `delay`, or `exit`.
        action:,
        # Why the step failed. Set when `status` is `ERROR`, `null` otherwise.
        error:,
        # Why the step was skipped, e.g. `Node conditions not met`. Set when `status` is
        # `SKIPPED`, `null` otherwise.
        skip_reason:,
        # The state of the step: the seven run statuses, plus `SKIPPED` and `COMPUTING`.
        # Not an enum — new values have been added before.
        status:,
        # When the step started, as an ISO 8601 timestamp.
        created_at: nil,
        # The message this step produced, present on send steps. Pass it to
        # `GET /messages/{message_id}` for delivery status. A send to a List or an
        # Audience yields one id for the request, not one per recipient.
        message_id: nil,
        # The id of the node in the published Journey that this step executed.
        node_id: nil,
        # When the step last changed state, as an ISO 8601 timestamp.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            action: String,
            error: T.nilable(Courier::JourneyRunStep::Error),
            skip_reason: T.nilable(String),
            status: String,
            created_at: String,
            message_id: String,
            node_id: String,
            updated_at: String
          }
        )
      end
      def to_hash
      end

      class Error < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::JourneyRunStep::Error, Courier::Internal::AnyHash)
          end

        # The reason, e.g. `Fetch failed: GET api.example.com returned 404` or
        # `AI step timed out after 15 minutes`.
        sig { returns(String) }
        attr_accessor :message

        # Why the step failed. Set when `status` is `ERROR`, `null` otherwise.
        sig { params(message: String).returns(T.attached_class) }
        def self.new(
          # The reason, e.g. `Fetch failed: GET api.example.com returned 404` or
          # `AI step timed out after 15 minutes`.
          message:
        )
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end
    end
  end
end
