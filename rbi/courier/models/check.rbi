# typed: strong

module Courier
  module Models
    class Check < Courier::Models::BaseCheck
      OrHash =
        T.type_alias { T.any(Courier::Check, Courier::Internal::AnyHash) }

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
