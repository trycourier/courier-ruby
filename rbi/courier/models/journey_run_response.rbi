# typed: strong

module Courier
  module Models
    class JourneyRunResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyRunResponse, Courier::Internal::AnyHash)
        end

      # One run of a Journey. `status` and `created_at` are absent on a small number of
      # legacy runs stored without them.
      sig { returns(Courier::JourneyRun) }
      attr_reader :run

      sig { params(run: Courier::JourneyRun::OrHash).void }
      attr_writer :run

      # A single Journey run.
      sig { params(run: Courier::JourneyRun::OrHash).returns(T.attached_class) }
      def self.new(
        # One run of a Journey. `status` and `created_at` are absent on a small number of
        # legacy runs stored without them.
        run:
      )
      end

      sig { override.returns({ run: Courier::JourneyRun }) }
      def to_hash
      end
    end
  end
end
