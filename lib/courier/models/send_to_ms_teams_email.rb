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
      #   @return [String]
      required :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String]
      required :tenant_id, String

      # @!method initialize(email:, service_url:, tenant_id:)
      #   @param email [String]
      #   @param service_url [String]
      #   @param tenant_id [String]
    end
  end
end
