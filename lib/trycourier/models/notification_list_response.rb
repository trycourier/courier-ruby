# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Notifications#list
    class NotificationListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!attribute results
      #
      #   @return [Array<Trycourier::Models::NotificationListResponse::Result>]
      required :results,
               -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Models::NotificationListResponse::Result] }

      # @!method initialize(paging:, results:)
      #   @param paging [Trycourier::Models::Paging]
      #   @param results [Array<Trycourier::Models::NotificationListResponse::Result>]

      class Result < Trycourier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Integer]
        required :created_at, Integer

        # @!attribute note
        #
        #   @return [String]
        required :note, String

        # @!attribute routing
        #
        #   @return [Trycourier::Models::MessageRouting]
        required :routing, -> { Trycourier::MessageRouting }

        # @!attribute topic_id
        #
        #   @return [String]
        required :topic_id, String

        # @!attribute updated_at
        #
        #   @return [Integer]
        required :updated_at, Integer

        # @!attribute tags
        #
        #   @return [Trycourier::Models::NotificationListResponse::Result::Tags, nil]
        optional :tags, -> { Trycourier::Models::NotificationListResponse::Result::Tags }, nil?: true

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!method initialize(id:, created_at:, note:, routing:, topic_id:, updated_at:, tags: nil, title: nil)
        #   @param id [String]
        #   @param created_at [Integer]
        #   @param note [String]
        #   @param routing [Trycourier::Models::MessageRouting]
        #   @param topic_id [String]
        #   @param updated_at [Integer]
        #   @param tags [Trycourier::Models::NotificationListResponse::Result::Tags, nil]
        #   @param title [String, nil]

        # @see Trycourier::Models::NotificationListResponse::Result#tags
        class Tags < Trycourier::Internal::Type::BaseModel
          # @!attribute data
          #
          #   @return [Array<Trycourier::Models::NotificationListResponse::Result::Tags::Data>]
          required :data,
                   -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Models::NotificationListResponse::Result::Tags::Data] }

          # @!method initialize(data:)
          #   @param data [Array<Trycourier::Models::NotificationListResponse::Result::Tags::Data>]

          class Data < Trycourier::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!method initialize(id:, name:)
            #   @param id [String]
            #   @param name [String]
          end
        end
      end
    end
  end
end
