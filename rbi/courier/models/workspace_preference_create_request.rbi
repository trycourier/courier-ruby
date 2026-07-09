# typed: strong

module Courier
  module Models
    class WorkspacePreferenceCreateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceCreateRequest,
            Courier::Internal::AnyHash
          )
        end

      # Human-readable name for the workspace preference.
      sig { returns(String) }
      attr_accessor :name

      # Optional description shown under the section on the hosted preferences page.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Whether the workspace preference defines custom routing for its topics.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :has_custom_routing

      # Default channels for the workspace preference. Defaults to empty if omitted.
      sig do
        returns(T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]))
      end
      attr_accessor :routing_options

      # Request body for creating a workspace preference.
      sig do
        params(
          name: String,
          description: T.nilable(String),
          has_custom_routing: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol])
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable name for the workspace preference.
        name:,
        # Optional description shown under the section on the hosted preferences page.
        description: nil,
        # Whether the workspace preference defines custom routing for its topics.
        has_custom_routing: nil,
        # Default channels for the workspace preference. Defaults to empty if omitted.
        routing_options: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            description: T.nilable(String),
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
