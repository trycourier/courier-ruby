# typed: strong

module Courier
  module Models
    class PreferenceSectionReplaceRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::PreferenceSectionReplaceRequest,
            Courier::Internal::AnyHash
          )
        end

      # Human-readable name for the section.
      sig { returns(String) }
      attr_accessor :name

      # Whether the section defines custom routing for its topics.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :has_custom_routing

      # Default channels for the section. Omit to clear.
      sig do
        returns(T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]))
      end
      attr_accessor :routing_options

      # Request body for replacing a preference section. Full document replacement;
      # missing optional fields are cleared.
      sig do
        params(
          name: String,
          has_custom_routing: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol])
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable name for the section.
        name:,
        # Whether the section defines custom routing for its topics.
        has_custom_routing: nil,
        # Default channels for the section. Omit to clear.
        routing_options: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            has_custom_routing: T.nilable(T::Boolean),
            routing_options:
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol])
          }
        )
      end
      def to_hash
      end
    end
  end
end
