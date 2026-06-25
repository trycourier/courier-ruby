# typed: strong

module Courier
  module Models
    class WorkspacePreferenceListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Courier::WorkspacePreferenceGetResponse]) }
      attr_accessor :results

      # The workspace's preferences, each with its topics.
      sig do
        params(
          results: T::Array[Courier::WorkspacePreferenceGetResponse::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(results:)
      end

      sig do
        override.returns(
          { results: T::Array[Courier::WorkspacePreferenceGetResponse] }
        )
      end
      def to_hash
      end
    end
  end
end
