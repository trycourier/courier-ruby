# typed: strong

module Courier
  module Models
    class Metadata < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Metadata, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(Courier::Utm)) }
      attr_reader :utm

      sig { params(utm: T.nilable(Courier::Utm::OrHash)).void }
      attr_writer :utm

      sig do
        params(utm: T.nilable(Courier::Utm::OrHash)).returns(T.attached_class)
      end
      def self.new(utm: nil)
      end

      sig { override.returns({ utm: T.nilable(Courier::Utm) }) }
      def to_hash
      end
    end
  end
end
