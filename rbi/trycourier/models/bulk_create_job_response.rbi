# typed: strong

module Trycourier
  module Models
    class BulkCreateJobResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::BulkCreateJobResponse,
            Trycourier::Internal::AnyHash
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
