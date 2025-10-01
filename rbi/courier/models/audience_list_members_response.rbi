# typed: strong

module Courier
  module Models
    class AudienceListMembersResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::AudienceListMembersResponse,
            Courier::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[Courier::Models::AudienceListMembersResponse::Item])
      end
      attr_accessor :items

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig do
        params(
          items:
            T::Array[
              Courier::Models::AudienceListMembersResponse::Item::OrHash
            ],
          paging: Courier::Paging::OrHash
        ).returns(T.attached_class)
      end
      def self.new(items:, paging:)
      end

      sig do
        override.returns(
          {
            items: T::Array[Courier::Models::AudienceListMembersResponse::Item],
            paging: Courier::Paging
          }
        )
      end
      def to_hash
      end

      class Item < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::AudienceListMembersResponse::Item,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :added_at

        sig { returns(String) }
        attr_accessor :audience_id

        sig { returns(Integer) }
        attr_accessor :audience_version

        sig { returns(String) }
        attr_accessor :member_id

        sig { returns(String) }
        attr_accessor :reason

        sig do
          params(
            added_at: String,
            audience_id: String,
            audience_version: Integer,
            member_id: String,
            reason: String
          ).returns(T.attached_class)
        end
        def self.new(
          added_at:,
          audience_id:,
          audience_version:,
          member_id:,
          reason:
        )
        end

        sig do
          override.returns(
            {
              added_at: String,
              audience_id: String,
              audience_version: Integer,
              member_id: String,
              reason: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
