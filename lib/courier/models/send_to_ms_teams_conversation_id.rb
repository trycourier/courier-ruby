# frozen_string_literal: true

module Courier
  module Models
    class SendToMsTeamsConversationID < Courier::Internal::Type::BaseModel
      # @!attribute conversation_id
      #
      #   @return [String]
      required :conversation_id, String

      # @!attribute service_url
      #
      #   @return [String]
      required :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String]
      required :tenant_id, String

      # @!method initialize(conversation_id:, service_url:, tenant_id:)
      #   @param conversation_id [String]
      #   @param service_url [String]
      #   @param tenant_id [String]
    end
  end
end
