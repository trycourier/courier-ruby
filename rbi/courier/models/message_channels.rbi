# typed: strong

module Courier
  module Models
    MessageChannels =
      T.let(
        Courier::Internal::Type::HashOf[Courier::Channel],
        Courier::Internal::Type::Converter
      )
  end
end
