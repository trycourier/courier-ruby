# frozen_string_literal: true

module Courier
  module Models
    class MsTeamsBaseProperties < Courier::Internal::Type::BaseModel
      # @!attribute service_url
      #
      #   @return [String, nil]
      optional :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(service_url: nil, tenant_id: nil)
      #   Tenant context shared by every MS Teams send variant. Provide at least one of
      #   `tenant_id` or `service_url`. If you provide both, they must agree — a
      #   `service_url` pointing at a different Microsoft tenant than `tenant_id` is
      #   rejected.
      #
      #   @param service_url [String]
      #   @param tenant_id [String]
    end
  end
end
