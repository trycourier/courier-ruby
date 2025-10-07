# typed: strong

module Courier
  module Models
    module InboundBulkMessage
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::InboundBulkMessage::InboundBulkTemplateMessage,
            Courier::InboundBulkMessage::InboundBulkContentMessage
          )
        end

      class InboundBulkTemplateMessage < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::InboundBulkMessage::InboundBulkTemplateMessage,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :template

        sig { returns(T.nilable(String)) }
        attr_accessor :brand

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T.nilable(String)) }
        attr_accessor :event

        sig { returns(T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]])) }
        attr_accessor :locale

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :override

        sig do
          params(
            template: String,
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            event: T.nilable(String),
            locale: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]]),
            override: T.nilable(T::Hash[Symbol, T.anything])
          ).returns(T.attached_class)
        end
        def self.new(
          template:,
          brand: nil,
          data: nil,
          event: nil,
          locale: nil,
          override: nil
        )
        end

        sig do
          override.returns(
            {
              template: String,
              brand: T.nilable(String),
              data: T.nilable(T::Hash[Symbol, T.anything]),
              event: T.nilable(String),
              locale: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]]),
              override: T.nilable(T::Hash[Symbol, T.anything])
            }
          )
        end
        def to_hash
        end
      end

      class InboundBulkContentMessage < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::InboundBulkMessage::InboundBulkContentMessage,
              Courier::Internal::AnyHash
            )
          end

        # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        sig do
          returns(
            T.any(
              Courier::ElementalContentSugar,
              Courier::Tenants::ElementalContent
            )
          )
        end
        attr_accessor :content

        sig { returns(T.nilable(String)) }
        attr_accessor :brand

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T.nilable(String)) }
        attr_accessor :event

        sig { returns(T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]])) }
        attr_accessor :locale

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :override

        sig do
          params(
            content:
              T.any(
                Courier::ElementalContentSugar::OrHash,
                Courier::Tenants::ElementalContent::OrHash
              ),
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            event: T.nilable(String),
            locale: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]]),
            override: T.nilable(T::Hash[Symbol, T.anything])
          ).returns(T.attached_class)
        end
        def self.new(
          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          content:,
          brand: nil,
          data: nil,
          event: nil,
          locale: nil,
          override: nil
        )
        end

        sig do
          override.returns(
            {
              content:
                T.any(
                  Courier::ElementalContentSugar,
                  Courier::Tenants::ElementalContent
                ),
              brand: T.nilable(String),
              data: T.nilable(T::Hash[Symbol, T.anything]),
              event: T.nilable(String),
              locale: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]]),
              override: T.nilable(T::Hash[Symbol, T.anything])
            }
          )
        end
        def to_hash
        end

        # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        module Content
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Courier::ElementalContentSugar,
                Courier::Tenants::ElementalContent
              )
            end

          sig do
            override.returns(
              T::Array[
                Courier::InboundBulkMessage::InboundBulkContentMessage::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end

      sig { override.returns(T::Array[Courier::InboundBulkMessage::Variants]) }
      def self.variants
      end
    end
  end
end
