# typed: strong

module Courier
  module Models
    MessageProviders =
      T.let(
        Courier::Internal::Type::HashOf[Courier::MessageProvidersType],
        Courier::Internal::Type::Converter
      )
  end
end
