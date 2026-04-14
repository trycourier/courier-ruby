# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplatePayload < Courier::Internal::Type::BaseModel
      # @!attribute brand
      #   Brand reference, or null for no brand.
      #
      #   @return [Courier::Models::NotificationTemplatePayload::Brand, nil]
      required :brand, -> { Courier::NotificationTemplatePayload::Brand }, nil?: true

      # @!attribute content
      #   Elemental content definition.
      #
      #   @return [Courier::Models::ElementalContent]
      required :content, -> { Courier::ElementalContent }

      # @!attribute name
      #   Display name for the template.
      #
      #   @return [String]
      required :name, String

      # @!attribute routing
      #   Routing strategy reference, or null for none.
      #
      #   @return [Courier::Models::NotificationTemplatePayload::Routing, nil]
      required :routing, -> { Courier::NotificationTemplatePayload::Routing }, nil?: true

      # @!attribute subscription
      #   Subscription topic reference, or null for none.
      #
      #   @return [Courier::Models::NotificationTemplatePayload::Subscription, nil]
      required :subscription, -> { Courier::NotificationTemplatePayload::Subscription }, nil?: true

      # @!attribute tags
      #   Tags for categorization. Send empty array for none.
      #
      #   @return [Array<String>]
      required :tags, Courier::Internal::Type::ArrayOf[String]

      # @!method initialize(brand:, content:, name:, routing:, subscription:, tags:)
      #   Core template fields used in POST and PUT request bodies (nested under a
      #   `notification` key) and returned at the top level in responses.
      #
      #   @param brand [Courier::Models::NotificationTemplatePayload::Brand, nil] Brand reference, or null for no brand.
      #
      #   @param content [Courier::Models::ElementalContent] Elemental content definition.
      #
      #   @param name [String] Display name for the template.
      #
      #   @param routing [Courier::Models::NotificationTemplatePayload::Routing, nil] Routing strategy reference, or null for none.
      #
      #   @param subscription [Courier::Models::NotificationTemplatePayload::Subscription, nil] Subscription topic reference, or null for none.
      #
      #   @param tags [Array<String>] Tags for categorization. Send empty array for none.

      # @see Courier::Models::NotificationTemplatePayload#brand
      class Brand < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   Brand reference, or null for no brand.
        #
        #   @param id [String]
      end

      # @see Courier::Models::NotificationTemplatePayload#routing
      class Routing < Courier::Internal::Type::BaseModel
        # @!attribute strategy_id
        #
        #   @return [String]
        required :strategy_id, String

        # @!method initialize(strategy_id:)
        #   Routing strategy reference, or null for none.
        #
        #   @param strategy_id [String]
      end

      # @see Courier::Models::NotificationTemplatePayload#subscription
      class Subscription < Courier::Internal::Type::BaseModel
        # @!attribute topic_id
        #
        #   @return [String]
        required :topic_id, String

        # @!method initialize(topic_id:)
        #   Subscription topic reference, or null for none.
        #
        #   @param topic_id [String]
      end
    end
  end
end
