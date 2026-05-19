# typed: strong

module Courier
  module Models
    class JourneyTemplateCreateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::JourneyTemplateCreateRequest,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :channel

      sig { returns(Courier::JourneyTemplateCreateRequest::Notification) }
      attr_reader :notification

      sig do
        params(
          notification:
            Courier::JourneyTemplateCreateRequest::Notification::OrHash
        ).void
      end
      attr_writer :notification

      sig { returns(T.nilable(String)) }
      attr_reader :provider_key

      sig { params(provider_key: String).void }
      attr_writer :provider_key

      sig { returns(T.nilable(String)) }
      attr_reader :state

      sig { params(state: String).void }
      attr_writer :state

      # Request body for creating a notification template scoped to a journey.
      sig do
        params(
          channel: String,
          notification:
            Courier::JourneyTemplateCreateRequest::Notification::OrHash,
          provider_key: String,
          state: String
        ).returns(T.attached_class)
      end
      def self.new(channel:, notification:, provider_key: nil, state: nil)
      end

      sig do
        override.returns(
          {
            channel: String,
            notification: Courier::JourneyTemplateCreateRequest::Notification,
            provider_key: String,
            state: String
          }
        )
      end
      def to_hash
      end

      class Notification < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::JourneyTemplateCreateRequest::Notification,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::JourneyTemplateCreateRequest::Notification::Brand
            )
          )
        end
        attr_reader :brand

        sig do
          params(
            brand:
              T.nilable(
                Courier::JourneyTemplateCreateRequest::Notification::Brand::OrHash
              )
          ).void
        end
        attr_writer :brand

        sig do
          returns(Courier::JourneyTemplateCreateRequest::Notification::Content)
        end
        attr_reader :content

        sig do
          params(
            content:
              Courier::JourneyTemplateCreateRequest::Notification::Content::OrHash
          ).void
        end
        attr_writer :content

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T.nilable(
              Courier::JourneyTemplateCreateRequest::Notification::Subscription
            )
          )
        end
        attr_reader :subscription

        sig do
          params(
            subscription:
              T.nilable(
                Courier::JourneyTemplateCreateRequest::Notification::Subscription::OrHash
              )
          ).void
        end
        attr_writer :subscription

        sig { returns(T::Array[String]) }
        attr_accessor :tags

        sig do
          params(
            brand:
              T.nilable(
                Courier::JourneyTemplateCreateRequest::Notification::Brand::OrHash
              ),
            content:
              Courier::JourneyTemplateCreateRequest::Notification::Content::OrHash,
            name: String,
            subscription:
              T.nilable(
                Courier::JourneyTemplateCreateRequest::Notification::Subscription::OrHash
              ),
            tags: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(brand:, content:, name:, subscription:, tags:)
        end

        sig do
          override.returns(
            {
              brand:
                T.nilable(
                  Courier::JourneyTemplateCreateRequest::Notification::Brand
                ),
              content:
                Courier::JourneyTemplateCreateRequest::Notification::Content,
              name: String,
              subscription:
                T.nilable(
                  Courier::JourneyTemplateCreateRequest::Notification::Subscription
                ),
              tags: T::Array[String]
            }
          )
        end
        def to_hash
        end

        class Brand < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneyTemplateCreateRequest::Notification::Brand,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { params(id: String).returns(T.attached_class) }
          def self.new(id:)
          end

          sig { override.returns({ id: String }) }
          def to_hash
          end
        end

        class Content < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneyTemplateCreateRequest::Notification::Content,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                T.any(
                  Courier::ElementalTextNodeWithType,
                  Courier::ElementalMetaNodeWithType,
                  Courier::ElementalChannelNodeWithType,
                  Courier::ElementalImageNodeWithType,
                  Courier::ElementalActionNodeWithType,
                  Courier::ElementalDividerNodeWithType,
                  Courier::ElementalQuoteNodeWithType,
                  Courier::ElementalHTMLNodeWithType
                )
              ]
            )
          end
          attr_accessor :elements

          sig do
            returns(
              Courier::JourneyTemplateCreateRequest::Notification::Content::Version::OrSymbol
            )
          end
          attr_accessor :version

          sig do
            returns(
              T.nilable(
                Courier::JourneyTemplateCreateRequest::Notification::Content::Scope::OrSymbol
              )
            )
          end
          attr_reader :scope

          sig do
            params(
              scope:
                Courier::JourneyTemplateCreateRequest::Notification::Content::Scope::OrSymbol
            ).void
          end
          attr_writer :scope

          sig do
            params(
              elements:
                T::Array[
                  T.any(
                    Courier::ElementalTextNodeWithType::OrHash,
                    Courier::ElementalMetaNodeWithType::OrHash,
                    Courier::ElementalChannelNodeWithType::OrHash,
                    Courier::ElementalImageNodeWithType::OrHash,
                    Courier::ElementalActionNodeWithType::OrHash,
                    Courier::ElementalDividerNodeWithType::OrHash,
                    Courier::ElementalQuoteNodeWithType::OrHash,
                    Courier::ElementalHTMLNodeWithType::OrHash
                  )
                ],
              version:
                Courier::JourneyTemplateCreateRequest::Notification::Content::Version::OrSymbol,
              scope:
                Courier::JourneyTemplateCreateRequest::Notification::Content::Scope::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(elements:, version:, scope: nil)
          end

          sig do
            override.returns(
              {
                elements:
                  T::Array[
                    T.any(
                      Courier::ElementalTextNodeWithType,
                      Courier::ElementalMetaNodeWithType,
                      Courier::ElementalChannelNodeWithType,
                      Courier::ElementalImageNodeWithType,
                      Courier::ElementalActionNodeWithType,
                      Courier::ElementalDividerNodeWithType,
                      Courier::ElementalQuoteNodeWithType,
                      Courier::ElementalHTMLNodeWithType
                    )
                  ],
                version:
                  Courier::JourneyTemplateCreateRequest::Notification::Content::Version::OrSymbol,
                scope:
                  Courier::JourneyTemplateCreateRequest::Notification::Content::Scope::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Version
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::JourneyTemplateCreateRequest::Notification::Content::Version
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VERSION_2022_01_01 =
              T.let(
                :"2022-01-01",
                Courier::JourneyTemplateCreateRequest::Notification::Content::Version::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::JourneyTemplateCreateRequest::Notification::Content::Version::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Scope
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::JourneyTemplateCreateRequest::Notification::Content::Scope
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DEFAULT =
              T.let(
                :default,
                Courier::JourneyTemplateCreateRequest::Notification::Content::Scope::TaggedSymbol
              )
            STRICT =
              T.let(
                :strict,
                Courier::JourneyTemplateCreateRequest::Notification::Content::Scope::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::JourneyTemplateCreateRequest::Notification::Content::Scope::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Subscription < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneyTemplateCreateRequest::Notification::Subscription,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :topic_id

          sig { params(topic_id: String).returns(T.attached_class) }
          def self.new(topic_id:)
          end

          sig { override.returns({ topic_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
