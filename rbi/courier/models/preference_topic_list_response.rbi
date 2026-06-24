# typed: strong

module Courier
  module Models
    class PreferenceTopicListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::PreferenceTopicListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Courier::PreferenceTopicGetResponse]) }
      attr_accessor :results

      # Topics contained in a preference section.
      sig do
        params(
          results: T::Array[Courier::PreferenceTopicGetResponse::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(results:)
      end

      sig do
        override.returns(
          { results: T::Array[Courier::PreferenceTopicGetResponse] }
        )
      end
      def to_hash
      end
    end
  end
end
