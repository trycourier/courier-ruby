# frozen_string_literal: true

module Courier
  module Models
    # Elemental content response for V2 templates. Contains versioned elements with
    # content checksums.
    #
    # @see Courier::Resources::Notifications#retrieve_content
    module NotificationRetrieveContentResponse
      extend Courier::Internal::Type::Union

      # Elemental content response for V2 templates. Contains versioned elements with content checksums.
      variant -> { Courier::NotificationContentGetResponse }

      variant -> { Courier::NotificationGetContent }

      # @!method self.variants
      #   @return [Array(Courier::Models::NotificationContentGetResponse, Courier::Models::NotificationGetContent)]
    end
  end
end
