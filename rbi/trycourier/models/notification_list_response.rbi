# typed: strong

module Trycourier
  module Models
    class NotificationListResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::NotificationListResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(Trycourier::Paging) }
      attr_reader :paging

      sig { params(paging: Trycourier::Paging::OrHash).void }
      attr_writer :paging

      sig do
        returns(T::Array[Trycourier::Models::NotificationListResponse::Result])
      end
      attr_accessor :results

      sig do
        params(
          paging: Trycourier::Paging::OrHash,
          results:
            T::Array[
              Trycourier::Models::NotificationListResponse::Result::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(paging:, results:)
      end

      sig do
        override.returns(
          {
            paging: Trycourier::Paging,
            results:
              T::Array[Trycourier::Models::NotificationListResponse::Result]
          }
        )
      end
      def to_hash
      end

      class Result < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::NotificationListResponse::Result,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Integer) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :note

        sig { returns(Trycourier::MessageRouting) }
        attr_reader :routing

        sig { params(routing: Trycourier::MessageRouting::OrHash).void }
        attr_writer :routing

        sig { returns(String) }
        attr_accessor :topic_id

        sig { returns(Integer) }
        attr_accessor :updated_at

        sig do
          returns(
            T.nilable(
              Trycourier::Models::NotificationListResponse::Result::Tags
            )
          )
        end
        attr_reader :tags

        sig do
          params(
            tags:
              T.nilable(
                Trycourier::Models::NotificationListResponse::Result::Tags::OrHash
              )
          ).void
        end
        attr_writer :tags

        sig { returns(T.nilable(String)) }
        attr_accessor :title

        sig do
          params(
            id: String,
            created_at: Integer,
            note: String,
            routing: Trycourier::MessageRouting::OrHash,
            topic_id: String,
            updated_at: Integer,
            tags:
              T.nilable(
                Trycourier::Models::NotificationListResponse::Result::Tags::OrHash
              ),
            title: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          note:,
          routing:,
          topic_id:,
          updated_at:,
          tags: nil,
          title: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Integer,
              note: String,
              routing: Trycourier::MessageRouting,
              topic_id: String,
              updated_at: Integer,
              tags:
                T.nilable(
                  Trycourier::Models::NotificationListResponse::Result::Tags
                ),
              title: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Tags < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Models::NotificationListResponse::Result::Tags,
                Trycourier::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                Trycourier::Models::NotificationListResponse::Result::Tags::Data
              ]
            )
          end
          attr_accessor :data

          sig do
            params(
              data:
                T::Array[
                  Trycourier::Models::NotificationListResponse::Result::Tags::Data::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(data:)
          end

          sig do
            override.returns(
              {
                data:
                  T::Array[
                    Trycourier::Models::NotificationListResponse::Result::Tags::Data
                  ]
              }
            )
          end
          def to_hash
          end

          class Data < Trycourier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Trycourier::Models::NotificationListResponse::Result::Tags::Data,
                  Trycourier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(String) }
            attr_accessor :name

            sig { params(id: String, name: String).returns(T.attached_class) }
            def self.new(id:, name:)
            end

            sig { override.returns({ id: String, name: String }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
