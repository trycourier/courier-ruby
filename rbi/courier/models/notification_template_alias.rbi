# typed: strong

module Courier
  module Models
    # A template's send-time alias as returned by a read, omitted entirely when it has
    # none. Usually a single string; an array for a template that resolves from
    # several aliases, which writes through this API can no longer produce — only
    # templates predating that restriction, or aliases attached outside this API, hold
    # more than one.
    module NotificationTemplateAlias
      extend Courier::Internal::Type::Union

      Variants = T.type_alias { T.any(String, T::Array[String]) }

      sig do
        override.returns(T::Array[Courier::NotificationTemplateAlias::Variants])
      end
      def self.variants
      end

      StringArray =
        T.let(
          Courier::Internal::Type::ArrayOf[String],
          Courier::Internal::Type::Converter
        )
    end
  end
end
