# typed: strong

module Trycourier
  module Models
    class InboundBulkMessage < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::InboundBulkMessage, Trycourier::Internal::AnyHash)
        end

      # Event ID or Notification ID (required). Can be either a Notification ID (e.g.,
      # "FRH3QXM9E34W4RKP7MRC8NZ1T8V8") or a custom Event ID (e.g., "welcome-email")
      # mapped to a notification.
      sig { returns(String) }
      attr_accessor :event

      sig { returns(T.nilable(String)) }
      attr_accessor :brand

      # Elemental content (optional, for V2 format). When provided, this will be used
      # instead of the notification associated with the `event` field.
      sig do
        returns(
          T.nilable(
            T.any(
              Trycourier::ElementalContentSugar,
              Trycourier::ElementalContent
            )
          )
        )
      end
      attr_accessor :content

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      sig { returns(T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]])) }
      attr_accessor :locale

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :override

      # Notification ID or template ID (optional, for V2 format). When provided, this
      # will be used instead of the notification associated with the `event` field.
      sig { returns(T.nilable(String)) }
      attr_accessor :template

      # Bulk message definition. Supports two formats:
      #
      # - V1 format: Requires `event` field (event ID or notification ID)
      # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
      #   content) in addition to `event`
      sig do
        params(
          event: String,
          brand: T.nilable(String),
          content:
            T.nilable(
              T.any(
                Trycourier::ElementalContentSugar::OrHash,
                Trycourier::ElementalContent::OrHash
              )
            ),
          data: T.nilable(T::Hash[Symbol, T.anything]),
          locale: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]]),
          override: T.nilable(T::Hash[Symbol, T.anything]),
          template: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Event ID or Notification ID (required). Can be either a Notification ID (e.g.,
        # "FRH3QXM9E34W4RKP7MRC8NZ1T8V8") or a custom Event ID (e.g., "welcome-email")
        # mapped to a notification.
        event:,
        brand: nil,
        # Elemental content (optional, for V2 format). When provided, this will be used
        # instead of the notification associated with the `event` field.
        content: nil,
        data: nil,
        locale: nil,
        override: nil,
        # Notification ID or template ID (optional, for V2 format). When provided, this
        # will be used instead of the notification associated with the `event` field.
        template: nil
      )
      end

      sig do
        override.returns(
          {
            event: String,
            brand: T.nilable(String),
            content:
              T.nilable(
                T.any(
                  Trycourier::ElementalContentSugar,
                  Trycourier::ElementalContent
                )
              ),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            locale: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.anything]]),
            override: T.nilable(T::Hash[Symbol, T.anything]),
            template: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Elemental content (optional, for V2 format). When provided, this will be used
      # instead of the notification associated with the `event` field.
      module Content
        extend Trycourier::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Trycourier::ElementalContentSugar,
              Trycourier::ElementalContent
            )
          end

        sig do
          override.returns(
            T::Array[Trycourier::InboundBulkMessage::Content::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
