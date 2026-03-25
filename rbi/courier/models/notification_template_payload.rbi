# typed: strong

module Courier
  module Models
    class NotificationTemplatePayload < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplatePayload,
            Courier::Internal::AnyHash
          )
        end

      # Brand reference, or null for no brand.
      sig { returns(T.nilable(Courier::NotificationTemplatePayload::Brand)) }
      attr_reader :brand

      sig do
        params(
          brand: T.nilable(Courier::NotificationTemplatePayload::Brand::OrHash)
        ).void
      end
      attr_writer :brand

      # Elemental content definition.
      sig { returns(Courier::ElementalContent) }
      attr_reader :content

      sig { params(content: Courier::ElementalContent::OrHash).void }
      attr_writer :content

      # Display name for the template.
      sig { returns(String) }
      attr_accessor :name

      # Routing strategy reference, or null for none.
      sig { returns(T.nilable(Courier::NotificationTemplatePayload::Routing)) }
      attr_reader :routing

      sig do
        params(
          routing:
            T.nilable(Courier::NotificationTemplatePayload::Routing::OrHash)
        ).void
      end
      attr_writer :routing

      # Subscription topic reference, or null for none.
      sig do
        returns(T.nilable(Courier::NotificationTemplatePayload::Subscription))
      end
      attr_reader :subscription

      sig do
        params(
          subscription:
            T.nilable(
              Courier::NotificationTemplatePayload::Subscription::OrHash
            )
        ).void
      end
      attr_writer :subscription

      # Tags for categorization. Send empty array for none.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      # Full document shape used in POST and PUT request bodies, and returned inside the
      # GET response envelope.
      sig do
        params(
          brand: T.nilable(Courier::NotificationTemplatePayload::Brand::OrHash),
          content: Courier::ElementalContent::OrHash,
          name: String,
          routing:
            T.nilable(Courier::NotificationTemplatePayload::Routing::OrHash),
          subscription:
            T.nilable(
              Courier::NotificationTemplatePayload::Subscription::OrHash
            ),
          tags: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Brand reference, or null for no brand.
        brand:,
        # Elemental content definition.
        content:,
        # Display name for the template.
        name:,
        # Routing strategy reference, or null for none.
        routing:,
        # Subscription topic reference, or null for none.
        subscription:,
        # Tags for categorization. Send empty array for none.
        tags:
      )
      end

      sig do
        override.returns(
          {
            brand: T.nilable(Courier::NotificationTemplatePayload::Brand),
            content: Courier::ElementalContent,
            name: String,
            routing: T.nilable(Courier::NotificationTemplatePayload::Routing),
            subscription:
              T.nilable(Courier::NotificationTemplatePayload::Subscription),
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
              Courier::NotificationTemplatePayload::Brand,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Brand reference, or null for no brand.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(id:)
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      class Routing < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationTemplatePayload::Routing,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :strategy_id

        # Routing strategy reference, or null for none.
        sig { params(strategy_id: String).returns(T.attached_class) }
        def self.new(strategy_id:)
        end

        sig { override.returns({ strategy_id: String }) }
        def to_hash
        end
      end

      class Subscription < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationTemplatePayload::Subscription,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :topic_id

        # Subscription topic reference, or null for none.
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
