# typed: strong

module Courier
  module Models
    class NotificationTemplateVersionListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateVersionListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig { returns(T::Array[Courier::VersionNode]) }
      attr_accessor :versions

      sig do
        params(
          paging: Courier::Paging::OrHash,
          versions: T::Array[Courier::VersionNode::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(paging:, versions:)
      end

      sig do
        override.returns(
          { paging: Courier::Paging, versions: T::Array[Courier::VersionNode] }
        )
      end
      def to_hash
      end
    end
  end
end
