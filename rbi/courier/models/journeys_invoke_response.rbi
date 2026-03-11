# typed: strong

module Courier
  module Models
    class JourneysInvokeResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneysInvokeResponse, Courier::Internal::AnyHash)
        end

      # A unique identifier for the journey run that was created.
      sig { returns(String) }
      attr_accessor :run_id

      sig { params(run_id: String).returns(T.attached_class) }
      def self.new(
        # A unique identifier for the journey run that was created.
        run_id:
      )
      end

      sig { override.returns({ run_id: String }) }
      def to_hash
      end
    end
  end
end
