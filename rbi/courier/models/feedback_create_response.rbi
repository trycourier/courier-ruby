# typed: strong

module Courier
  module Models
    class FeedbackCreateResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::FeedbackCreateResponse,
            Courier::Internal::AnyHash
          )
        end

      # The ID of the stored report, `fbk_` followed by a ULID.
      sig { returns(String) }
      attr_accessor :feedback_id

      sig { params(feedback_id: String).returns(T.attached_class) }
      def self.new(
        # The ID of the stored report, `fbk_` followed by a ULID.
        feedback_id:
      )
      end

      sig { override.returns({ feedback_id: String }) }
      def to_hash
      end
    end
  end
end
