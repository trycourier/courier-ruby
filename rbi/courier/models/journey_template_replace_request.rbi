# typed: strong

module Courier
  module Models
    class JourneyTemplateReplaceRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::JourneyTemplateReplaceRequest,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::JourneyTemplateReplaceRequest::Notification) }
      attr_reader :notification

      sig do
        params(
          notification:
            Courier::JourneyTemplateReplaceRequest::Notification::OrHash
        ).void
      end
      attr_writer :notification

      sig { returns(T.nilable(String)) }
      attr_reader :state

      sig { params(state: String).void }
      attr_writer :state

      # Request body for replacing a journey-scoped notification template draft.
      sig do
        params(
          notification:
            Courier::JourneyTemplateReplaceRequest::Notification::OrHash,
          state: String
        ).returns(T.attached_class)
      end
      def self.new(notification:, state: nil)
      end

      sig do
        override.returns(
          {
            notification: Courier::JourneyTemplateReplaceRequest::Notification,
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
              Courier::JourneyTemplateReplaceRequest::Notification,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::JourneyTemplateReplaceRequest::Notification::Brand
            )
          )
        end
        attr_reader :brand

        sig do
          params(
            brand:
              T.nilable(
                Courier::JourneyTemplateReplaceRequest::Notification::Brand::OrHash
              )
          ).void
        end
        attr_writer :brand

        sig do
          returns(Courier::JourneyTemplateReplaceRequest::Notification::Content)
        end
        attr_reader :content

        sig do
          params(
            content:
              Courier::JourneyTemplateReplaceRequest::Notification::Content::OrHash
          ).void
        end
        attr_writer :content

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T.nilable(
              Courier::JourneyTemplateReplaceRequest::Notification::Subscription
            )
          )
        end
        attr_reader :subscription

        sig do
          params(
            subscription:
              T.nilable(
                Courier::JourneyTemplateReplaceRequest::Notification::Subscription::OrHash
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
                Courier::JourneyTemplateReplaceRequest::Notification::Brand::OrHash
              ),
            content:
              Courier::JourneyTemplateReplaceRequest::Notification::Content::OrHash,
            name: String,
            subscription:
              T.nilable(
                Courier::JourneyTemplateReplaceRequest::Notification::Subscription::OrHash
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
                  Courier::JourneyTemplateReplaceRequest::Notification::Brand
                ),
              content:
                Courier::JourneyTemplateReplaceRequest::Notification::Content,
              name: String,
              subscription:
                T.nilable(
                  Courier::JourneyTemplateReplaceRequest::Notification::Subscription
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
                Courier::JourneyTemplateReplaceRequest::Notification::Brand,
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
                Courier::JourneyTemplateReplaceRequest::Notification::Content,
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
              Courier::JourneyTemplateReplaceRequest::Notification::Content::Version::OrSymbol
            )
          end
          attr_accessor :version

          sig do
            returns(
              T.nilable(
                Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope::OrSymbol
              )
            )
          end
          attr_reader :scope

          sig do
            params(
              scope:
                Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope::OrSymbol
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
                Courier::JourneyTemplateReplaceRequest::Notification::Content::Version::OrSymbol,
              scope:
                Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope::OrSymbol
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
                  Courier::JourneyTemplateReplaceRequest::Notification::Content::Version::OrSymbol,
                scope:
                  Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope::OrSymbol
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
                  Courier::JourneyTemplateReplaceRequest::Notification::Content::Version
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VERSION_2022_01_01 =
              T.let(
                :"2022-01-01",
                Courier::JourneyTemplateReplaceRequest::Notification::Content::Version::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::JourneyTemplateReplaceRequest::Notification::Content::Version::TaggedSymbol
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
                  Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DEFAULT =
              T.let(
                :default,
                Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope::TaggedSymbol
              )
            STRICT =
              T.let(
                :strict,
                Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope::TaggedSymbol
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
                Courier::JourneyTemplateReplaceRequest::Notification::Subscription,
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
