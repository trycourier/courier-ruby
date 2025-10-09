# typed: strong

module Trycourier
  module Models
    class ElementalContent < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::ElementalContent, Trycourier::Internal::AnyHash)
        end

      sig do
        returns(
          T::Array[
            T.any(
              Trycourier::ElementalTextNodeWithType,
              Trycourier::ElementalMetaNodeWithType,
              Trycourier::ElementalChannelNodeWithType,
              Trycourier::ElementalImageNodeWithType,
              Trycourier::ElementalActionNodeWithType,
              Trycourier::ElementalDividerNodeWithType,
              Trycourier::ElementalQuoteNodeWithType
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
                Trycourier::ElementalTextNodeWithType::OrHash,
                Trycourier::ElementalMetaNodeWithType::OrHash,
                Trycourier::ElementalChannelNodeWithType::OrHash,
                Trycourier::ElementalImageNodeWithType::OrHash,
                Trycourier::ElementalActionNodeWithType::OrHash,
                Trycourier::ElementalDividerNodeWithType::OrHash,
                Trycourier::ElementalQuoteNodeWithType::OrHash
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
                  Trycourier::ElementalTextNodeWithType,
                  Trycourier::ElementalMetaNodeWithType,
                  Trycourier::ElementalChannelNodeWithType,
                  Trycourier::ElementalImageNodeWithType,
                  Trycourier::ElementalActionNodeWithType,
                  Trycourier::ElementalDividerNodeWithType,
                  Trycourier::ElementalQuoteNodeWithType
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
