# frozen_string_literal: true

module Courier
  module Models
    module Lists
      # @see Courier::Resources::Lists::Subscriptions#list
      class SubscriptionListResponse < Courier::Internal::Type::BaseModel
        # @!attribute items
        #
        #   @return [Array<Courier::Models::Lists::SubscriptionListResponse::Item>]
        required :items,
                 -> { Courier::Internal::Type::ArrayOf[Courier::Models::Lists::SubscriptionListResponse::Item] }

        # @!attribute paging
        #
        #   @return [Courier::Models::Paging]
        required :paging, -> { Courier::Paging }

        # @!method initialize(items:, paging:)
        #   @param items [Array<Courier::Models::Lists::SubscriptionListResponse::Item>]
        #   @param paging [Courier::Models::Paging]

        class Item < Courier::Internal::Type::BaseModel
          # @!attribute recipient_id
          #
          #   @return [String]
          required :recipient_id, String, api_name: :recipientId

          # @!attribute created
          #
          #   @return [String, nil]
          optional :created, String, nil?: true

          # @!attribute preferences
          #
          #   @return [Courier::Models::RecipientPreferences, nil]
          optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

          # @!method initialize(recipient_id:, created: nil, preferences: nil)
          #   @param recipient_id [String]
          #   @param created [String, nil]
          #   @param preferences [Courier::Models::RecipientPreferences, nil]
        end
      end
    end
  end
end
