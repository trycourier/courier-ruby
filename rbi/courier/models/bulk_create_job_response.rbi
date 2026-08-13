# typed: strong

module Courier
  module Models
    class BulkCreateJobResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::BulkCreateJobResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :job_id

      sig { params(job_id: String).returns(T.attached_class) }
      def self.new(job_id:)
      end

      sig { override.returns({ job_id: String }) }
      def to_hash
      end
    end
  end
end
