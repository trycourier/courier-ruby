# typed: strong

module Courier
  module Models
    # How often a digest is delivered. `instant` delivers immediately without
    # batching, and is the one value that takes no `time`.
    module DigestFrequency
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::DigestFrequency) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INSTANT = T.let(:instant, Courier::DigestFrequency::TaggedSymbol)
      DAILY = T.let(:daily, Courier::DigestFrequency::TaggedSymbol)
      WEEKDAYS = T.let(:weekdays, Courier::DigestFrequency::TaggedSymbol)
      WEEKLY = T.let(:weekly, Courier::DigestFrequency::TaggedSymbol)
      CUSTOM_DAYS = T.let(:custom_days, Courier::DigestFrequency::TaggedSymbol)
      MONTHLY = T.let(:monthly, Courier::DigestFrequency::TaggedSymbol)

      sig { override.returns(T::Array[Courier::DigestFrequency::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
