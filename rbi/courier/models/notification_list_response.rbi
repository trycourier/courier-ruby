# typed: strong

module Courier
  module Models
    class NotificationListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::NotificationListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig do
        returns(T::Array[Courier::Models::NotificationListResponse::Result])
      end
      attr_accessor :results

      sig do
        params(
          paging: Courier::Paging::OrHash,
          results:
            T::Array[Courier::Models::NotificationListResponse::Result::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(paging:, results:)
      end

      sig do
        override.returns(
          {
            paging: Courier::Paging,
            results: T::Array[Courier::Models::NotificationListResponse::Result]
          }
        )
      end
      def to_hash
      end

      class Result < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::NotificationListResponse::Result,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Integer) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :note

        sig { returns(Courier::MessageRouting) }
        attr_reader :routing

        sig { params(routing: Courier::MessageRouting::OrHash).void }
        attr_writer :routing

        sig { returns(String) }
        attr_accessor :topic_id

        sig { returns(Integer) }
        attr_accessor :updated_at

        sig do
          returns(
            T.nilable(Courier::Models::NotificationListResponse::Result::Tags)
          )
        end
        attr_reader :tags

        sig do
          params(
            tags:
              T.nilable(
                Courier::Models::NotificationListResponse::Result::Tags::OrHash
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
            routing: Courier::MessageRouting::OrHash,
            topic_id: String,
            updated_at: Integer,
            tags:
              T.nilable(
                Courier::Models::NotificationListResponse::Result::Tags::OrHash
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
              routing: Courier::MessageRouting,
              topic_id: String,
              updated_at: Integer,
              tags:
                T.nilable(
                  Courier::Models::NotificationListResponse::Result::Tags
                ),
              title: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Tags < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Models::NotificationListResponse::Result::Tags,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                Courier::Models::NotificationListResponse::Result::Tags::Data
              ]
            )
          end
          attr_accessor :data

          sig do
            params(
              data:
                T::Array[
                  Courier::Models::NotificationListResponse::Result::Tags::Data::OrHash
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
                    Courier::Models::NotificationListResponse::Result::Tags::Data
                  ]
              }
            )
          end
          def to_hash
          end

          class Data < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Models::NotificationListResponse::Result::Tags::Data,
                  Courier::Internal::AnyHash
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
