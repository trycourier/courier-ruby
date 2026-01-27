# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#list_users
    class BulkListUsersResponse < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::BulkListUsersResponse::Item>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::Models::BulkListUsersResponse::Item] }

      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Courier::Models::BulkListUsersResponse::Item>]
      #   @param paging [Courier::Models::Paging]

      class Item < Courier::Models::InboundBulkMessageUser
        # @!attribute status
        #
        #   @return [Symbol, Courier::Models::BulkListUsersResponse::Item::Status]
        required :status, enum: -> { Courier::Models::BulkListUsersResponse::Item::Status }

        # @!attribute message_id
        #
        #   @return [String, nil]
        optional :message_id, String, api_name: :messageId, nil?: true

        # @!method initialize(status:, message_id: nil)
        #   @param status [Symbol, Courier::Models::BulkListUsersResponse::Item::Status]
        #   @param message_id [String, nil]

        module Status
          extend Courier::Internal::Type::Enum

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
