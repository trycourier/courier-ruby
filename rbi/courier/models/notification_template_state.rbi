# typed: strong

module Courier
  module Models
    # Template state. Defaults to `DRAFT`.
    module NotificationTemplateState
      extend Courier::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Courier::NotificationTemplateState) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DRAFT = T.let(:DRAFT, Courier::NotificationTemplateState::TaggedSymbol)
      PUBLISHED =
        T.let(:PUBLISHED, Courier::NotificationTemplateState::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Courier::NotificationTemplateState::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
