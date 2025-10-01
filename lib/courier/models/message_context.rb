# frozen_string_literal: true

module Courier
  module Models
    class MessageContext < Courier::Internal::Type::BaseModel
      # @!attribute tenant_id
      #   An id of a tenant, see
      #   [tenants api docs](https://www.courier.com/docs/reference/tenants/). Will load
      #   brand, default preferences and any other base context data associated with this
      #   tenant.
      #
      #   @return [String, nil]
      optional :tenant_id, String, nil?: true

      # @!method initialize(tenant_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::MessageContext} for more details.
      #
      #   @param tenant_id [String, nil] An id of a tenant, see [tenants api docs](https://www.courier.com/docs/reference
    end
  end
end
