# typed: strong

module Courier
  module Models
    class JourneyRunListItem < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyRunListItem, Courier::Internal::AnyHash)
        end

      # A unique identifier representing the run.
      sig { returns(String) }
      attr_accessor :run_id

      # Internal provenance strings describing what started the run. Diagnostic only.
      sig { returns(T::Array[String]) }
      attr_accessor :source

      # When the run started, as an ISO 8601 timestamp.
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # The state of the run. See `JourneyRun.status` for the values it takes.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # The id of the Journey this run belongs to.
      sig { returns(T.nilable(String)) }
      attr_reader :template_id

      sig { params(template_id: String).void }
      attr_writer :template_id

      # A Journey run as it appears in a list response, without `updated_at`.
      sig do
        params(
          run_id: String,
          source: T::Array[String],
          created_at: String,
          status: String,
          template_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier representing the run.
        run_id:,
        # Internal provenance strings describing what started the run. Diagnostic only.
        source:,
        # When the run started, as an ISO 8601 timestamp.
        created_at: nil,
        # The state of the run. See `JourneyRun.status` for the values it takes.
        status: nil,
        # The id of the Journey this run belongs to.
        template_id: nil
      )
      end

      sig do
        override.returns(
          {
            run_id: String,
            source: T::Array[String],
            created_at: String,
            status: String,
            template_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
