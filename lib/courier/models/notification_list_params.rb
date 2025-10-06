# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#list
    class NotificationListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute notes
      #   Retrieve the notes from the Notification template settings.
      #
      #   @return [Boolean, nil]
      optional :notes, Courier::Internal::Type::Boolean, nil?: true

      # @!method initialize(cursor: nil, notes: nil, request_options: {})
      #   @param cursor [String, nil]
      #
      #   @param notes [Boolean, nil] Retrieve the notes from the Notification template settings.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
