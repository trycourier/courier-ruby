# typed: strong

module Courier
  module Models
    class WorkspacePreferenceTopicListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceTopicListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Courier::WorkspacePreferenceTopicGetResponse]) }
      attr_accessor :results

      # Topics contained in a workspace preference.
      sig do
        params(
          results:
            T::Array[Courier::WorkspacePreferenceTopicGetResponse::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(results:)
      end

      sig do
        override.returns(
          { results: T::Array[Courier::WorkspacePreferenceTopicGetResponse] }
        )
      end
      def to_hash
      end
    end
  end
end
