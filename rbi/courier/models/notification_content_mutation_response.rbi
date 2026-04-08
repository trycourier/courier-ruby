# typed: strong

module Courier
  module Models
    class NotificationContentMutationResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationContentMutationResponse,
            Courier::Internal::AnyHash
          )
        end

      # Template ID.
      sig { returns(String) }
      attr_accessor :id

      sig do
        returns(T::Array[Courier::NotificationContentMutationResponse::Element])
      end
      attr_accessor :elements

      # Template state. Defaults to `DRAFT`.
      sig { returns(Courier::NotificationTemplateState::TaggedSymbol) }
      attr_accessor :state

      # Content version identifier.
      sig { returns(String) }
      attr_accessor :version

      # Shared mutation response for `PUT` content, `PUT` element, and `PUT` locale
      # operations. Contains the template ID, content version, per-element checksums,
      # and resulting state.
      sig do
        params(
          id: String,
          elements:
            T::Array[
              Courier::NotificationContentMutationResponse::Element::OrHash
            ],
          state: Courier::NotificationTemplateState::OrSymbol,
          version: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Template ID.
        id:,
        elements:,
        # Template state. Defaults to `DRAFT`.
        state:,
        # Content version identifier.
        version:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            elements:
              T::Array[Courier::NotificationContentMutationResponse::Element],
            state: Courier::NotificationTemplateState::TaggedSymbol,
            version: String
          }
        )
      end
      def to_hash
      end

      class Element < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationContentMutationResponse::Element,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :checksum

        sig { params(id: String, checksum: String).returns(T.attached_class) }
        def self.new(id:, checksum:)
        end

        sig { override.returns({ id: String, checksum: String }) }
        def to_hash
        end
      end
    end
  end
end
