# typed: strong

module Trycourier
  module Models
    class AutomationTemplateListResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::AutomationTemplateListResponse,
            Trycourier::Internal::AnyHash
          )
        end

      # A cursor token for pagination. Present when there are more results available.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(T::Array[Trycourier::AutomationTemplate])) }
      attr_reader :templates

      sig do
        params(templates: T::Array[Trycourier::AutomationTemplate::OrHash]).void
      end
      attr_writer :templates

      sig do
        params(
          cursor: String,
          templates: T::Array[Trycourier::AutomationTemplate::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # A cursor token for pagination. Present when there are more results available.
        cursor: nil,
        templates: nil
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            templates: T::Array[Trycourier::AutomationTemplate]
          }
        )
      end
      def to_hash
      end
    end
  end
end
