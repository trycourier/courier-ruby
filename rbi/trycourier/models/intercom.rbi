# typed: strong

module Trycourier
  module Models
    class Intercom < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::Intercom, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :from

      sig { returns(Trycourier::IntercomRecipient) }
      attr_reader :to

      sig { params(to: Trycourier::IntercomRecipient::OrHash).void }
      attr_writer :to

      sig do
        params(from: String, to: Trycourier::IntercomRecipient::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(from:, to:)
      end

      sig do
        override.returns({ from: String, to: Trycourier::IntercomRecipient })
      end
      def to_hash
      end
    end
  end
end
