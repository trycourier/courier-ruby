# frozen_string_literal: true

module Courier
  module Models
    class SendToMsTeamsEmail < Courier::Internal::Type::BaseModel
      # @!attribute email
      #
      #   @return [String]
      required :email, String

      # @!attribute service_url
      #
      #   @return [String, nil]
      optional :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(email:, service_url: nil, tenant_id: nil)
      #   Provide at least one of `tenant_id` or `service_url`. If you provide both, they
      #   must agree.
      #
      #   @param email [String]
      #   @param service_url [String]
      #   @param tenant_id [String]
    end
  end
end
