# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::RoutingStrategies#list_notifications
    class AssociatedNotificationListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::NotificationTemplateSummary>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::NotificationTemplateSummary] }

      # @!method initialize(paging:, results:)
      #   Paginated list of notification templates associated with a routing strategy.
      #
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::NotificationTemplateSummary>]
    end
  end
end
