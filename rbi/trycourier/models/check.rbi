# typed: strong

module Trycourier
  module Models
    class Check < Trycourier::Models::BaseCheck
      OrHash =
        T.type_alias { T.any(Trycourier::Check, Trycourier::Internal::AnyHash) }

      sig { returns(Integer) }
      attr_accessor :updated

      sig { params(updated: Integer).returns(T.attached_class) }
      def self.new(updated:)
      end

      sig { override.returns({ updated: Integer }) }
      def to_hash
      end
    end
  end
end
