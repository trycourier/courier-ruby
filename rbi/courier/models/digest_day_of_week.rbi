# typed: strong

module Courier
  module Models
    # A day of the week. Accepted case-insensitively, returned lowercase.
    module DigestDayOfWeek
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::DigestDayOfWeek) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      SUNDAY = T.let(:sunday, Courier::DigestDayOfWeek::TaggedSymbol)
      MONDAY = T.let(:monday, Courier::DigestDayOfWeek::TaggedSymbol)
      TUESDAY = T.let(:tuesday, Courier::DigestDayOfWeek::TaggedSymbol)
      WEDNESDAY = T.let(:wednesday, Courier::DigestDayOfWeek::TaggedSymbol)
      THURSDAY = T.let(:thursday, Courier::DigestDayOfWeek::TaggedSymbol)
      FRIDAY = T.let(:friday, Courier::DigestDayOfWeek::TaggedSymbol)
      SATURDAY = T.let(:saturday, Courier::DigestDayOfWeek::TaggedSymbol)

      sig { override.returns(T::Array[Courier::DigestDayOfWeek::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
