# frozen_string_literal: true

module Trycourier
  module Models
    module Lists
      # @see Trycourier::Resources::Lists::Subscriptions#list
      class SubscriptionListResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute items
        #
        #   @return [Array<Trycourier::Models::Lists::SubscriptionListResponse::Item>]
        required :items,
                 -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Models::Lists::SubscriptionListResponse::Item] }

        # @!attribute paging
        #
        #   @return [Trycourier::Models::Paging]
        required :paging, -> { Trycourier::Paging }

        # @!method initialize(items:, paging:)
        #   @param items [Array<Trycourier::Models::Lists::SubscriptionListResponse::Item>]
        #   @param paging [Trycourier::Models::Paging]

        class Item < Trycourier::Internal::Type::BaseModel
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
          #   @return [Trycourier::Models::RecipientPreferences, nil]
          optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

          # @!method initialize(recipient_id:, created: nil, preferences: nil)
          #   @param recipient_id [String]
          #   @param created [String, nil]
          #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
        end
      end
    end
  end
end
