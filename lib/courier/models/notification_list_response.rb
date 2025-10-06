# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#list
    class NotificationListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::NotificationListResponse::Result>]
      required :results,
               -> { Courier::Internal::Type::ArrayOf[Courier::Models::NotificationListResponse::Result] }

      # @!method initialize(paging:, results:)
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::NotificationListResponse::Result>]

      class Result < Courier::Internal::Type::BaseModel
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
        #   @return [Courier::Models::MessageRouting]
        required :routing, -> { Courier::MessageRouting }

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
        #   @return [Courier::Models::NotificationListResponse::Result::Tags, nil]
        optional :tags, -> { Courier::Models::NotificationListResponse::Result::Tags }, nil?: true

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!method initialize(id:, created_at:, note:, routing:, topic_id:, updated_at:, tags: nil, title: nil)
        #   @param id [String]
        #   @param created_at [Integer]
        #   @param note [String]
        #   @param routing [Courier::Models::MessageRouting]
        #   @param topic_id [String]
        #   @param updated_at [Integer]
        #   @param tags [Courier::Models::NotificationListResponse::Result::Tags, nil]
        #   @param title [String, nil]

        # @see Courier::Models::NotificationListResponse::Result#tags
        class Tags < Courier::Internal::Type::BaseModel
          # @!attribute data
          #
          #   @return [Array<Courier::Models::NotificationListResponse::Result::Tags::Data>]
          required :data,
                   -> { Courier::Internal::Type::ArrayOf[Courier::Models::NotificationListResponse::Result::Tags::Data] }

          # @!method initialize(data:)
          #   @param data [Array<Courier::Models::NotificationListResponse::Result::Tags::Data>]

          class Data < Courier::Internal::Type::BaseModel
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
