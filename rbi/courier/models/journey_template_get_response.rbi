# typed: strong

module Courier
  module Models
    class JourneyTemplateGetResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyTemplateGetResponse, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(Courier::JourneyTemplateGetResponse::Brand)) }
      attr_reader :brand

      sig do
        params(
          brand: T.nilable(Courier::JourneyTemplateGetResponse::Brand::OrHash)
        ).void
      end
      attr_writer :brand

      sig { returns(Courier::JourneyTemplateGetResponse::Content) }
      attr_reader :content

      sig do
        params(
          content: Courier::JourneyTemplateGetResponse::Content::OrHash
        ).void
      end
      attr_writer :content

      sig { returns(Integer) }
      attr_accessor :created

      sig { returns(String) }
      attr_accessor :creator

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Courier::JourneyTemplateGetResponse::State::TaggedSymbol) }
      attr_accessor :state

      sig do
        returns(T.nilable(Courier::JourneyTemplateGetResponse::Subscription))
      end
      attr_reader :subscription

      sig do
        params(
          subscription:
            T.nilable(Courier::JourneyTemplateGetResponse::Subscription::OrHash)
        ).void
      end
      attr_writer :subscription

      sig { returns(T::Array[String]) }
      attr_accessor :tags

      sig { returns(T.nilable(Integer)) }
      attr_reader :updated

      sig { params(updated: Integer).void }
      attr_writer :updated

      sig { returns(T.nilable(String)) }
      attr_reader :updater

      sig { params(updater: String).void }
      attr_writer :updater

      sig do
        params(
          id: String,
          brand: T.nilable(Courier::JourneyTemplateGetResponse::Brand::OrHash),
          content: Courier::JourneyTemplateGetResponse::Content::OrHash,
          created: Integer,
          creator: String,
          name: String,
          state: Courier::JourneyTemplateGetResponse::State::OrSymbol,
          subscription:
            T.nilable(
              Courier::JourneyTemplateGetResponse::Subscription::OrHash
            ),
          tags: T::Array[String],
          updated: Integer,
          updater: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        brand:,
        content:,
        created:,
        creator:,
        name:,
        state:,
        subscription:,
        tags:,
        updated: nil,
        updater: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            brand: T.nilable(Courier::JourneyTemplateGetResponse::Brand),
            content: Courier::JourneyTemplateGetResponse::Content,
            created: Integer,
            creator: String,
            name: String,
            state: Courier::JourneyTemplateGetResponse::State::TaggedSymbol,
            subscription:
              T.nilable(Courier::JourneyTemplateGetResponse::Subscription),
            tags: T::Array[String],
            updated: Integer,
            updater: String
          }
        )
      end
      def to_hash
      end

      class Brand < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::JourneyTemplateGetResponse::Brand,
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
              Courier::JourneyTemplateGetResponse::Content,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Courier::ElementalNode::Variants]) }
        attr_accessor :elements

        sig do
          returns(
            Courier::JourneyTemplateGetResponse::Content::Version::TaggedSymbol
          )
        end
        attr_accessor :version

        sig do
          returns(
            T.nilable(
              Courier::JourneyTemplateGetResponse::Content::Scope::TaggedSymbol
            )
          )
        end
        attr_reader :scope

        sig do
          params(
            scope: Courier::JourneyTemplateGetResponse::Content::Scope::OrSymbol
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
              Courier::JourneyTemplateGetResponse::Content::Version::OrSymbol,
            scope: Courier::JourneyTemplateGetResponse::Content::Scope::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(elements:, version:, scope: nil)
        end

        sig do
          override.returns(
            {
              elements: T::Array[Courier::ElementalNode::Variants],
              version:
                Courier::JourneyTemplateGetResponse::Content::Version::TaggedSymbol,
              scope:
                Courier::JourneyTemplateGetResponse::Content::Scope::TaggedSymbol
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
                Courier::JourneyTemplateGetResponse::Content::Version
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VERSION_2022_01_01 =
            T.let(
              :"2022-01-01",
              Courier::JourneyTemplateGetResponse::Content::Version::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::JourneyTemplateGetResponse::Content::Version::TaggedSymbol
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
              T.all(Symbol, Courier::JourneyTemplateGetResponse::Content::Scope)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DEFAULT =
            T.let(
              :default,
              Courier::JourneyTemplateGetResponse::Content::Scope::TaggedSymbol
            )
          STRICT =
            T.let(
              :strict,
              Courier::JourneyTemplateGetResponse::Content::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::JourneyTemplateGetResponse::Content::Scope::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module State
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyTemplateGetResponse::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT =
          T.let(
            :DRAFT,
            Courier::JourneyTemplateGetResponse::State::TaggedSymbol
          )
        PUBLISHED =
          T.let(
            :PUBLISHED,
            Courier::JourneyTemplateGetResponse::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyTemplateGetResponse::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Subscription < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::JourneyTemplateGetResponse::Subscription,
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
