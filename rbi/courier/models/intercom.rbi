# typed: strong

module Courier
  module Models
    class Intercom < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Intercom, Courier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :from

      sig { returns(Courier::IntercomRecipient) }
      attr_reader :to

      sig { params(to: Courier::IntercomRecipient::OrHash).void }
      attr_writer :to

      sig do
        params(from: String, to: Courier::IntercomRecipient::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(from:, to:)
      end

      sig { override.returns({ from: String, to: Courier::IntercomRecipient }) }
      def to_hash
      end
    end
  end
end
