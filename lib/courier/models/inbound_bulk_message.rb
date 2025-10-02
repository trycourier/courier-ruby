# frozen_string_literal: true

module Courier
  module Models
    class InboundBulkMessage < Courier::Internal::Type::BaseModel
      # @!attribute brand
      #   A unique identifier that represents the brand that should be used for rendering
      #   the notification.
      #
      #   @return [String, nil]
      optional :brand, String, nil?: true

      # @!attribute data
      #   JSON that includes any data you want to pass to a message template. The data
      #   will populate the corresponding template variables.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute event
      #
      #   @return [String, nil]
      optional :event, String, nil?: true

      # @!attribute locale
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :locale, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute message
      #   Describes the content of the message in a way that will work for email, push,
      #   chat, or any channel.
      #
      #   @return [Courier::Models::InboundBulkMessage::Message::InboundBulkTemplateMessage, Courier::Models::InboundBulkMessage::Message::InboundBulkContentMessage, nil]
      optional :message, union: -> { Courier::InboundBulkMessage::Message }, nil?: true

      # @!attribute override
      #   JSON that is merged into the request sent by Courier to the provider to override
      #   properties or to gain access to features in the provider API that are not
      #   natively supported by Courier.
      #
      #   @return [Object, nil]
      optional :override, Courier::Internal::Type::Unknown

      # @!method initialize(brand: nil, data: nil, event: nil, locale: nil, message: nil, override: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::InboundBulkMessage} for more details.
      #
      #   @param brand [String, nil] A unique identifier that represents the brand that should be used
      #
      #   @param data [Hash{Symbol=>Object}, nil] JSON that includes any data you want to pass to a message template.
      #
      #   @param event [String, nil]
      #
      #   @param locale [Hash{Symbol=>Object}, nil]
      #
      #   @param message [Courier::Models::InboundBulkMessage::Message::InboundBulkTemplateMessage, Courier::Models::InboundBulkMessage::Message::InboundBulkContentMessage, nil] Describes the content of the message in a way that will
      #
      #   @param override [Object] JSON that is merged into the request sent by Courier to the provider

      # Describes the content of the message in a way that will work for email, push,
      # chat, or any channel.
      #
      # @see Courier::Models::InboundBulkMessage#message
      module Message
        extend Courier::Internal::Type::Union

        # Describes the content of the message in a way that will
        # work for email, push, chat, or any channel.
        variant -> { Courier::InboundBulkMessage::Message::InboundBulkTemplateMessage }

        # A template for a type of message that can be sent more than once.
        # For example, you might create an "Appointment Reminder" Notification or
        # “Reset Password” Notifications.
        variant -> { Courier::InboundBulkMessage::Message::InboundBulkContentMessage }

        class InboundBulkTemplateMessage < Courier::Models::BaseMessage
          # @!attribute template
          #   The id of the notification template to be rendered and sent to the recipient(s).
          #   This field or the content field must be supplied.
          #
          #   @return [String]
          required :template, String

          # @!method initialize(template:)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::InboundBulkMessage::Message::InboundBulkTemplateMessage} for
          #   more details.
          #
          #   Describes the content of the message in a way that will work for email, push,
          #   chat, or any channel.
          #
          #   @param template [String] The id of the notification template to be rendered and sent to the recipient(s).
        end

        class InboundBulkContentMessage < Courier::Models::BaseMessage
          # @!attribute content
          #   Describes the content of the message in a way that will work for email, push,
          #   chat, or any channel. Either this or template must be specified.
          #
          #   @return [Courier::Models::Tenants::ElementalContent, Courier::Models::Content::ElementalContentSugar]
          required :content, union: -> { Courier::Content }

          # @!method initialize(content:)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::InboundBulkMessage::Message::InboundBulkContentMessage} for
          #   more details.
          #
          #   A template for a type of message that can be sent more than once. For example,
          #   you might create an "Appointment Reminder" Notification or “Reset Password”
          #   Notifications.
          #
          #   @param content [Courier::Models::Tenants::ElementalContent, Courier::Models::Content::ElementalContentSugar] Describes the content of the message in a way that will work for email, push,
        end

        # @!method self.variants
        #   @return [Array(Courier::Models::InboundBulkMessage::Message::InboundBulkTemplateMessage, Courier::Models::InboundBulkMessage::Message::InboundBulkContentMessage)]
      end
    end
  end
end
