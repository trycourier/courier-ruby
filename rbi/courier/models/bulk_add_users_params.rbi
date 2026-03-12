# typed: strong

module Courier
  module Models
    class BulkAddUsersParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::BulkAddUsersParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :job_id

      sig { returns(T::Array[Courier::InboundBulkMessageUser]) }
      attr_accessor :users

      sig do
        params(
          job_id: String,
          users: T::Array[Courier::InboundBulkMessageUser::OrHash],
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(job_id:, users:, request_options: {})
      end

      sig do
        override.returns(
          {
            job_id: String,
            users: T::Array[Courier::InboundBulkMessageUser],
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
