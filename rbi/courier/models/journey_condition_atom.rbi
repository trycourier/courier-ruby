# typed: strong

module Courier
  module Models
    JourneyConditionAtom =
      T.let(
        Courier::Internal::Type::ArrayOf[String],
        Courier::Internal::Type::Converter
      )
  end
end
