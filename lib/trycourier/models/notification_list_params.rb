# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Notifications#list
    class NotificationListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute notes
      #   Retrieve the notes from the Notification template settings.
      #
      #   @return [Boolean, nil]
      optional :notes, Trycourier::Internal::Type::Boolean, nil?: true

      # @!method initialize(cursor: nil, notes: nil, request_options: {})
      #   @param cursor [String, nil]
      #
      #   @param notes [Boolean, nil] Retrieve the notes from the Notification template settings.
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
