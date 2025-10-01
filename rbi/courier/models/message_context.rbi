# typed: strong

module Courier
  module Models
    class MessageContext < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MessageContext, Courier::Internal::AnyHash)
        end

      # An id of a tenant, see
      # [tenants api docs](https://www.courier.com/docs/reference/tenants/). Will load
      # brand, default preferences and any other base context data associated with this
      # tenant.
      sig { returns(T.nilable(String)) }
      attr_accessor :tenant_id

      sig { params(tenant_id: T.nilable(String)).returns(T.attached_class) }
      def self.new(
        # An id of a tenant, see
        # [tenants api docs](https://www.courier.com/docs/reference/tenants/). Will load
        # brand, default preferences and any other base context data associated with this
        # tenant.
        tenant_id: nil
      )
      end

      sig { override.returns({ tenant_id: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
