# typed: strong

module Courier
  module Models
    class PreferenceSectionListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::PreferenceSectionListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Courier::PreferenceSectionGetResponse]) }
      attr_accessor :results

      # The workspace's preference sections, each with its topics.
      sig do
        params(
          results: T::Array[Courier::PreferenceSectionGetResponse::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(results:)
      end

      sig do
        override.returns(
          { results: T::Array[Courier::PreferenceSectionGetResponse] }
        )
      end
      def to_hash
      end
    end
  end
end
