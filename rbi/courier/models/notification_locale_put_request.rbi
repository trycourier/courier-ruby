# typed: strong

module Courier
  module Models
    class NotificationLocalePutRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationLocalePutRequest,
            Courier::Internal::AnyHash
          )
        end

      # Elements with locale-specific content overrides.
      sig { returns(T::Array[Courier::NotificationLocalePutRequest::Element]) }
      attr_accessor :elements

      # Template state. Defaults to `DRAFT`.
      sig { returns(T.nilable(Courier::NotificationTemplateState::OrSymbol)) }
      attr_reader :state

      sig { params(state: Courier::NotificationTemplateState::OrSymbol).void }
      attr_writer :state

      # Request body for setting locale-specific content overrides. Each element
      # override must include the target element ID.
      sig do
        params(
          elements:
            T::Array[Courier::NotificationLocalePutRequest::Element::OrHash],
          state: Courier::NotificationTemplateState::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Elements with locale-specific content overrides.
        elements:,
        # Template state. Defaults to `DRAFT`.
        state: nil
      )
      end

      sig do
        override.returns(
          {
            elements: T::Array[Courier::NotificationLocalePutRequest::Element],
            state: Courier::NotificationTemplateState::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Element < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationLocalePutRequest::Element,
              Courier::Internal::AnyHash
            )
          end

        # Target element ID.
        sig { returns(String) }
        attr_accessor :id

        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Target element ID.
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end
    end
  end
end
