# typed: strong

module Trycourier
  module Models
    class MessageContext < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::MessageContext, Trycourier::Internal::AnyHash)
        end

      # Tenant id used to load brand/default preferences/context.
      sig { returns(T.nilable(String)) }
      attr_accessor :tenant_id

      sig { params(tenant_id: T.nilable(String)).returns(T.attached_class) }
      def self.new(
        # Tenant id used to load brand/default preferences/context.
        tenant_id: nil
      )
      end

      sig { override.returns({ tenant_id: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
