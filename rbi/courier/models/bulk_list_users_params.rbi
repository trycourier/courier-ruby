# typed: strong

module Courier
  module Models
    class BulkListUsersParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::BulkListUsersParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :job_id

      # A unique identifier that allows for fetching the next set of users added to the
      # bulk job
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      sig do
        params(
          job_id: String,
          cursor: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        job_id:,
        # A unique identifier that allows for fetching the next set of users added to the
        # bulk job
        cursor: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            job_id: String,
            cursor: T.nilable(String),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
