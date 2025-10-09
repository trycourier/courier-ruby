# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Bulk#list_users
    class BulkListUsersResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Trycourier::Models::BulkListUsersResponse::Item>]
      required :items,
               -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Models::BulkListUsersResponse::Item] }

      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Trycourier::Models::BulkListUsersResponse::Item>]
      #   @param paging [Trycourier::Models::Paging]

      class Item < Trycourier::Models::InboundBulkMessageUser
        # @!attribute status
        #
        #   @return [Symbol, Trycourier::Models::BulkListUsersResponse::Item::Status]
        required :status, enum: -> { Trycourier::Models::BulkListUsersResponse::Item::Status }

        # @!attribute message_id
        #
        #   @return [String, nil]
        optional :message_id, String, api_name: :messageId, nil?: true

        # @!method initialize(status:, message_id: nil)
        #   @param status [Symbol, Trycourier::Models::BulkListUsersResponse::Item::Status]
        #   @param message_id [String, nil]

        module Status
          extend Trycourier::Internal::Type::Enum

          PENDING = :PENDING
          ENQUEUED = :ENQUEUED
          ERROR = :ERROR

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
