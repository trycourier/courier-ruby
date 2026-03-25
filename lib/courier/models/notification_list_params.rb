# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#list
    class NotificationListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Opaque pagination cursor from a previous response. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute event_id
      #   Filter to templates linked to this event map ID.
      #
      #   @return [String, nil]
      optional :event_id, String

      # @!attribute notes
      #   Include template notes in the response. Only applies to legacy templates.
      #
      #   @return [Boolean, nil]
      optional :notes, Courier::Internal::Type::Boolean, nil?: true

      # @!method initialize(cursor: nil, event_id: nil, notes: nil, request_options: {})
      #   @param cursor [String, nil] Opaque pagination cursor from a previous response. Omit for the first page.
      #
      #   @param event_id [String] Filter to templates linked to this event map ID.
      #
      #   @param notes [Boolean, nil] Include template notes in the response. Only applies to legacy templates.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
