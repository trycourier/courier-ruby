# frozen_string_literal: true

module Trycourier
  module Models
    class SendToMsTeamsUserID < Trycourier::Internal::Type::BaseModel
      # @!attribute service_url
      #
      #   @return [String]
      required :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String]
      required :tenant_id, String

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!method initialize(service_url:, tenant_id:, user_id:)
      #   @param service_url [String]
      #   @param tenant_id [String]
      #   @param user_id [String]
    end
  end
end
