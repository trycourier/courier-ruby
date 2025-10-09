# frozen_string_literal: true

module Trycourier
  module Models
    class MessageContext < Trycourier::Internal::Type::BaseModel
      # @!attribute tenant_id
      #   Tenant id used to load brand/default preferences/context.
      #
      #   @return [String, nil]
      optional :tenant_id, String, nil?: true

      # @!method initialize(tenant_id: nil)
      #   @param tenant_id [String, nil] Tenant id used to load brand/default preferences/context.
    end
  end
end
