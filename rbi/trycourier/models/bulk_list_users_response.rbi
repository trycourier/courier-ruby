# typed: strong

module Trycourier
  module Models
    class BulkListUsersResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::BulkListUsersResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Trycourier::Models::BulkListUsersResponse::Item]) }
      attr_accessor :items

      sig { returns(Trycourier::Paging) }
      attr_reader :paging

      sig { params(paging: Trycourier::Paging::OrHash).void }
      attr_writer :paging

      sig do
        params(
          items:
            T::Array[Trycourier::Models::BulkListUsersResponse::Item::OrHash],
          paging: Trycourier::Paging::OrHash
        ).returns(T.attached_class)
      end
      def self.new(items:, paging:)
      end

      sig do
        override.returns(
          {
            items: T::Array[Trycourier::Models::BulkListUsersResponse::Item],
            paging: Trycourier::Paging
          }
        )
      end
      def to_hash
      end

      class Item < Trycourier::Models::InboundBulkMessageUser
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::BulkListUsersResponse::Item,
              Trycourier::Internal::AnyHash
            )
          end

        sig do
          returns(
            Trycourier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_accessor :message_id

        sig do
          params(
            status:
              Trycourier::Models::BulkListUsersResponse::Item::Status::OrSymbol,
            message_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(status:, message_id: nil)
        end

        sig do
          override.returns(
            {
              status:
                Trycourier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol,
              message_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Status
          extend Trycourier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Trycourier::Models::BulkListUsersResponse::Item::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :PENDING,
              Trycourier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
            )
          ENQUEUED =
            T.let(
              :ENQUEUED,
              Trycourier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
            )
          ERROR =
            T.let(
              :ERROR,
              Trycourier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Trycourier::Models::BulkListUsersResponse::Item::Status::TaggedSymbol
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
