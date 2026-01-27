# typed: strong

module Courier
  module Models
    class BulkListUsersResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::BulkListUsersResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Courier::Models::BulkListUsersResponse::Item]) }
      attr_accessor :items

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig do
        params(
          items: T::Array[Courier::Models::BulkListUsersResponse::Item::OrHash],
          paging: Courier::Paging::OrHash
        ).returns(T.attached_class)
      end
      def self.new(items:, paging:)
      end

      sig do
        override.returns(
          {
            items: T::Array[Courier::Models::BulkListUsersResponse::Item],
            paging: Courier::Paging
          }
        )
      end
      def to_hash
      end

      class Item < Courier::Models::InboundBulkMessageUser
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::BulkListUsersResponse::Item,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            Courier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_accessor :message_id

        sig do
          params(
            status:
              Courier::Models::BulkListUsersResponse::Item::Status::OrSymbol,
            message_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(status:, message_id: nil)
        end

        sig do
          override.returns(
            {
              status:
                Courier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol,
              message_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Status
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::Models::BulkListUsersResponse::Item::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :PENDING,
              Courier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
            )
          ENQUEUED =
            T.let(
              :ENQUEUED,
              Courier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
            )
          ERROR =
            T.let(
              :ERROR,
              Courier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
