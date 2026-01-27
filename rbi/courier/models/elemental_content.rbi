# typed: strong

module Courier
  module Models
    class ElementalContent < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalContent, Courier::Internal::AnyHash)
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
              Courier::ElementalQuoteNodeWithType
            )
          ]
        )
      end
      attr_accessor :elements

      # For example, "2022-01-01"
      sig { returns(String) }
      attr_accessor :version

      sig { returns(T.nilable(String)) }
      attr_accessor :brand

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
                Courier::ElementalQuoteNodeWithType::OrHash
              )
            ],
          version: String,
          brand: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        elements:,
        # For example, "2022-01-01"
        version:,
        brand: nil
      )
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
                  Courier::ElementalQuoteNodeWithType
                )
              ],
            version: String,
            brand: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
