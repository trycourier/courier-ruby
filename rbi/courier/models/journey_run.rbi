# typed: strong

module Courier
  module Models
    class JourneyRun < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::JourneyRun, Courier::Internal::AnyHash) }

      # A unique identifier representing the run.
      sig { returns(String) }
      attr_accessor :run_id

      # Internal provenance strings describing what started the run, e.g.
      # `invoke/<journey_id>` or `segment/page/Pricing Page`. Diagnostic only — the
      # format is unstable and should not be parsed.
      sig { returns(T::Array[String]) }
      attr_accessor :source

      # When the run started, as an ISO 8601 timestamp.
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # The state of the run: `PROCESSING`, `PROCESSED`, `WAITING`, `CANCELED`, `ERROR`,
      # `THROTTLED`, or `NOT PROCESSED`. Not an enum — new values have been added
      # before.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # The id of the Journey this run belongs to.
      sig { returns(T.nilable(String)) }
      attr_reader :template_id

      sig { params(template_id: String).void }
      attr_writer :template_id

      # When the run last changed state, as an ISO 8601 timestamp.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # One run of a Journey. `status` and `created_at` are absent on a small number of
      # legacy runs stored without them.
      sig do
        params(
          run_id: String,
          source: T::Array[String],
          created_at: String,
          status: String,
          template_id: String,
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier representing the run.
        run_id:,
        # Internal provenance strings describing what started the run, e.g.
        # `invoke/<journey_id>` or `segment/page/Pricing Page`. Diagnostic only — the
        # format is unstable and should not be parsed.
        source:,
        # When the run started, as an ISO 8601 timestamp.
        created_at: nil,
        # The state of the run: `PROCESSING`, `PROCESSED`, `WAITING`, `CANCELED`, `ERROR`,
        # `THROTTLED`, or `NOT PROCESSED`. Not an enum — new values have been added
        # before.
        status: nil,
        # The id of the Journey this run belongs to.
        template_id: nil,
        # When the run last changed state, as an ISO 8601 timestamp.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            run_id: String,
            source: T::Array[String],
            created_at: String,
            status: String,
            template_id: String,
            updated_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
