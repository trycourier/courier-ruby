# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::AuditEvents#retrieve
    class AuditEventRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute audit_event_id
      #
      #   @return [String]
      required :audit_event_id, String

      # @!method initialize(audit_event_id:, request_options: {})
      #   @param audit_event_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
