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
      #   Notification templates in this workspace.
      #
      #   @return [Array<Courier::Models::NotificationListResponse::Result::Notification, Courier::Models::NotificationTemplateSummary>]
      required :results,
               -> { Courier::Internal::Type::ArrayOf[union: Courier::Models::NotificationListResponse::Result] }

      # @!method initialize(paging:, results:)
      #   @param paging [Courier::Models::Paging]
      #
      #   @param results [Array<Courier::Models::NotificationListResponse::Result::Notification, Courier::Models::NotificationTemplateSummary>] Notification templates in this workspace.

      # V2 (CDS) template summary returned in list responses.
      module Result
        extend Courier::Internal::Type::Union

        variant -> { Courier::Models::NotificationListResponse::Result::Notification }

        # V2 (CDS) template summary returned in list responses.
        variant -> { Courier::NotificationTemplateSummary }

        class Notification < Courier::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #
          #   @return [Integer]
          required :created_at, Integer

          # @!attribute event_ids
          #   Array of event IDs associated with this notification
          #
          #   @return [Array<String>]
          required :event_ids, Courier::Internal::Type::ArrayOf[String]

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
          #   @return [Courier::Models::NotificationListResponse::Result::Notification::Tags, nil]
          optional :tags, -> { Courier::Models::NotificationListResponse::Result::Notification::Tags }, nil?: true

          # @!attribute title
          #
          #   @return [String, nil]
          optional :title, String, nil?: true

          # @!method initialize(id:, created_at:, event_ids:, note:, routing:, topic_id:, updated_at:, tags: nil, title: nil)
          #   @param id [String]
          #
          #   @param created_at [Integer]
          #
          #   @param event_ids [Array<String>] Array of event IDs associated with this notification
          #
          #   @param note [String]
          #
          #   @param routing [Courier::Models::MessageRouting]
          #
          #   @param topic_id [String]
          #
          #   @param updated_at [Integer]
          #
          #   @param tags [Courier::Models::NotificationListResponse::Result::Notification::Tags, nil]
          #
          #   @param title [String, nil]

          # @see Courier::Models::NotificationListResponse::Result::Notification#tags
          class Tags < Courier::Internal::Type::BaseModel
            # @!attribute data
            #
            #   @return [Array<Courier::Models::NotificationListResponse::Result::Notification::Tags::Data>]
            required :data,
                     -> { Courier::Internal::Type::ArrayOf[Courier::Models::NotificationListResponse::Result::Notification::Tags::Data] }

            # @!method initialize(data:)
            #   @param data [Array<Courier::Models::NotificationListResponse::Result::Notification::Tags::Data>]

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

        # @!method self.variants
        #   @return [Array(Courier::Models::NotificationListResponse::Result::Notification, Courier::Models::NotificationTemplateSummary)]
      end
    end
  end
end
