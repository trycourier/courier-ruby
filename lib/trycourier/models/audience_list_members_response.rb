# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Audiences#list_members
    class AudienceListMembersResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Trycourier::Models::AudienceListMembersResponse::Item>]
      required :items,
               -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Models::AudienceListMembersResponse::Item] }

      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Trycourier::Models::AudienceListMembersResponse::Item>]
      #   @param paging [Trycourier::Models::Paging]

      class Item < Trycourier::Internal::Type::BaseModel
        # @!attribute added_at
        #
        #   @return [String]
        required :added_at, String

        # @!attribute audience_id
        #
        #   @return [String]
        required :audience_id, String

        # @!attribute audience_version
        #
        #   @return [Integer]
        required :audience_version, Integer

        # @!attribute member_id
        #
        #   @return [String]
        required :member_id, String

        # @!attribute reason
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(added_at:, audience_id:, audience_version:, member_id:, reason:)
        #   @param added_at [String]
        #   @param audience_id [String]
        #   @param audience_version [Integer]
        #   @param member_id [String]
        #   @param reason [String]
      end
    end
  end
end
